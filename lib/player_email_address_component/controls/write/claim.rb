module PlayerEmailAddressComponent
  module Controls
    module Write
      module Claim
        def self.call(id: nil, email_address: nil, player_id: nil)
          id ||= ID.example
          email_address ||= PlayerEmailAddress.email_address
          player_id ||= Player.id

          encoded_email_address = Digest::SHA256.hexdigest(email_address.downcase)

          claim = Commands::Claim.example(
            id: id,
            encoded_email_address: encoded_email_address,
            email_address: email_address,
            player_id: player_id
          )

          stream_name = Messaging::StreamName.command_stream_name(encoded_email_address, 'playerEmailAddress')

          Messaging::Postgres::Write.(claim, stream_name)
        end
      end
    end
  end
end
