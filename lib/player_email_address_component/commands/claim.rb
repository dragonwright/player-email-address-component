module PlayerEmailAddressComponent
  module Commands
    class Claim
      include Command

      def self.configure(receiver, attr_name: nil, **kwargs)
        attr_name ||= :claim
        instance = build(**kwargs)
        receiver.public_send("#{attr_name}=", instance)
      end

      def self.call(
        player_email_address_claim_id:,
        email_address:,
        player_id:,
        previous_message: nil
      )
        instance = self.build
        instance.(
          player_email_address_claim_id: player_email_address_claim_id,
          email_address: email_address,
          player_id: player_id,
          previous_message: previous_message
        )
      end

      def call(
        player_email_address_claim_id:,
        email_address:,
        player_id:,
        previous_message: nil
      )
        encoded_email_address = encode_email_address(email_address)

        claim = self.class.build_message(Messages::Commands::Claim, previous_message)

        claim.player_email_address_claim_id = player_email_address_claim_id
        claim.encoded_email_address = encoded_email_address
        claim.email_address = email_address
        claim.player_id = player_id
        claim.time = clock.iso8601

        stream_name = command_stream_name(encoded_email_address)

        write.(claim, stream_name)

        claim
      end

      def encode_email_address(email_address)
        downcase_email_address = email_address.downcase
        Digest::SHA256.hexdigest(downcase_email_address)
      end
    end
  end
end
