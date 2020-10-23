module PlayerEmailAddressComponent
  class PlayerEmailAddress
    include Schema::DataStructure

    attribute :id, String
    attribute :email_address, String
    attribute :player_id, String
    attribute :claimed_time, Time
    attribute :sequence, Integer

    def claimed?
      !claimed_time.nil?
    end

    def processed?(message_sequence)
      return false if sequence.nil?

      sequence >= message_sequence
    end
  end
end
