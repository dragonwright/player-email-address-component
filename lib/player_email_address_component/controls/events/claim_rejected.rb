module PlayerEmailAddressComponent
  module Controls
    module Events
      module ClaimRejected
        def self.example
          claim_rejected = PlayerEmailAddressComponent::Messages::Events::ClaimRejected.build

          claim_rejected.player_email_address_claim_id = ID.example
          claim_rejected.encoded_email_address = PlayerEmailAddress.encoded_email_address
          claim_rejected.email_address = PlayerEmailAddress.email_address
          claim_rejected.player_id = Player.id
          claim_rejected.time = Controls::Time::Effective.example

          claim_rejected.sequence = Sequence.example

          claim_rejected
        end
      end
    end
  end
end
