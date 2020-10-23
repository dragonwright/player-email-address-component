require_relative '../../../automated_init'

context "Handle Commands" do
  context "Transactions" do
    context "Claim" do
      context "Claimed" do
        handler = Handlers::Commands::Transactions.new
        claim = Controls::Commands::Claim.example

        player_email_address = Controls::PlayerEmailAddress::New.example

        sequence = claim.metadata.global_position

        clock_time = Controls::Time::Processed::Raw.example

        fixture(
          Messaging::Fixtures::Handler,
          handler,
          claim,
          player_email_address,
          clock_time: clock_time
        ) do |handler|
          claimed = handler.assert_write(Messages::Events::Claimed) do |write|
            write.assert_stream_name("playerEmailAddress-#{claim.encoded_email_address}")
            write.assert_expected_version(:no_stream)
          end

          handler.assert_written_message(claimed) do |claimed|
            claimed.assert_attributes_copied([
              :player_email_address_claim_id,
              :encoded_email_address,
              :email_address,
              :player_id,
              :time
            ])

            claimed.assert_attribute_value(:processed_time, Clock.iso8601(clock_time))
            claimed.assert_attribute_value(:sequence, sequence)

            claimed.assert_attributes_assigned
          end
        end
      end
    end
  end
end
