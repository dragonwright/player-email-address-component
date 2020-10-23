module PlayerEmailAddressComponent
  module Handlers
    class Commands
      include Log::Dependency
      include Messaging::Handle
      include Messaging::StreamName
      include Messages::Commands
      include Messages::Events

      dependency :write, Messaging::Postgres::Write
      dependency :clock, Clock::UTC
      dependency :store, Store

      def configure(session: nil)
        Messaging::Postgres::Write.configure(self, session: session)
        Clock::UTC.configure(self)
        Store.configure(self, session: session)
      end

      category :player_email_address

      handle Claim do |claim|
        transaction_stream_name = stream_name(claim.player_email_address_claim_id, 'playerEmailAddressTransaction')

        claim = Claim.follow(claim)

        Try.(MessageStore::ExpectedVersion::Error) do
          write.initial(claim, transaction_stream_name)
        end
      end
    end
  end
end
