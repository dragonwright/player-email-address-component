module PlayerEmailAddressComponent
  module Messages
    module Events
      class Claimed
        include Messaging::Message

        attribute :player_email_address_claim_id, String
        attribute :encoded_email_address, String
        attribute :email_address, String
        attribute :player_id, String
        attribute :time, String
        attribute :processed_time, String
        attribute :sequence, Integer
      end
    end
  end
end
