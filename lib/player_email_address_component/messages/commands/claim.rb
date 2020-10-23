module PlayerEmailAddressComponent
  module Messages
    module Commands
      class Claim
        include Messaging::Message

        attribute :player_email_address_claim_id, String
        attribute :encoded_email_address, String
        attribute :email_address, String
        attribute :player_id, String
        attribute :time, String
      end
    end
  end
end
