module PlayerEmailAddressComponent
  module Controls
    module PlayerEmailAddress
      def self.example(sequence: nil)
        player_email_address = PlayerEmailAddressComponent::PlayerEmailAddress.build

        player_email_address.id = encoded_email_address

        player_email_address.sequence = sequence unless sequence.nil?

        player_email_address
      end

      def self.encoded_email_address
        "f660ab912ec121d1b1e928a0bb4bc61b15f5ad44d5efdc4e1c92a25e99b8e44a"
      end

      def self.email_address
        "test@test.com"
      end

      module New
        def self.example
          PlayerEmailAddressComponent::PlayerEmailAddress.build
        end
      end

      module Claimed
        def self.example
          player_email_address = PlayerEmailAddress.example
          player_email_address.claimed_time = Time::Effective::Raw.example
          player_email_address
        end
      end

      module Sequence
        def self.example
          sequence = Controls::Sequence.example

          PlayerEmailAddress.example(sequence: sequence)
        end
      end
    end
  end
end
