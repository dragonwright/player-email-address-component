require_relative '../../../automated_init'

context "Handle Commands" do
  context "Transactions" do
    context "Claim" do
      context "Rejected" do
        handler = Handlers::Commands::Transactions.new
        claim = Controls::Commands::Claim.example

        player_email_address = Controls::PlayerEmailAddress::Claimed.example
        player_email_address_version = Controls::Version.example

        sequence = claim.metadata.global_position

        clock_time = Controls::Time::Processed::Raw.example

        fixture(
          Messaging::Fixtures::Handler,
          handler,
          claim,
          player_email_address,
          player_email_address_version,
          clock_time: clock_time
        ) do |handler|
          claim_rejected = handler.assert_write(Messages::Events::ClaimRejected) do |write|
            write.assert_stream_name("playerEmailAddress-#{player_email_address.id}")
            write.assert_expected_version(player_email_address_version)
          end

          handler.assert_written_message(claim_rejected) do |claim_rejected|
            claim_rejected.assert_attributes_copied([
              :player_email_address_claim_id,
              :encoded_email_address,
              :email_address,
              :player_id
            ])

            claim_rejected.assert_attribute_value(:time, Clock.iso8601(clock_time))
            claim_rejected.assert_attribute_value(:sequence, sequence)

            claim_rejected.assert_attributes_assigned
          end
        end
      end
    end
  end
end
