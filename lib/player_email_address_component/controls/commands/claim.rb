module PlayerEmailAddressComponent
  module Controls
    module Commands
      module Claim
        def self.example(id: nil, encoded_email_address: nil, email_address: nil, player_id: nil)
          id ||= ID.example
          encoded_email_address ||= PlayerEmailAddress.encoded_email_address
          email_address ||= PlayerEmailAddress.email_address
          player_id ||= Player.id

          claim = PlayerEmailAddressComponent::Messages::Commands::Claim.build

          claim.player_email_address_claim_id = id
          claim.encoded_email_address = encoded_email_address
          claim.email_address = email_address
          claim.player_id = player_id
          claim.time = Controls::Time::Effective.example

          claim.metadata.global_position = Position.example

          claim
        end
      end
    end
  end
end
