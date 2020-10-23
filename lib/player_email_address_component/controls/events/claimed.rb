module PlayerEmailAddressComponent
  module Controls
    module Events
      module Claimed
        def self.example
          claimed = PlayerEmailAddressComponent::Messages::Events::Claimed.build

          claimed.player_email_address_claim_id = ID.example
          claimed.encoded_email_address = PlayerEmailAddress.encoded_email_address
          claimed.email_address = PlayerEmailAddress.email_address
          claimed.player_id = Player.id
          claimed.time = Controls::Time::Effective.example
          claimed.processed_time = Controls::Time::Processed.example

          claimed.sequence = Sequence.example

          claimed
        end
      end
    end
  end
end
