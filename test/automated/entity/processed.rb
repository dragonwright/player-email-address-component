require_relative '../automated_init'

context "Player Email Address" do
  context "Processed" do
    sequence = Controls::Sequence.example

    context "Has not yet processed" do
      context "Player Email Address's sequence is lower than the sequence" do
        player_email_address = Controls::PlayerEmailAddress.example(sequence: sequence - 1)

        processed = player_email_address.processed?(sequence)

        test do
          refute(processed)
        end
      end

      context "Player Email Address's sequence is nil" do
        player_email_address = Controls::PlayerEmailAddress.example(sequence: nil)

        processed = player_email_address.processed?(sequence)

        test do
          refute(processed)
        end
      end
    end

    context "Has processed" do
      context "Player Email Address's sequence is greater than the sequence" do
        player_email_address = Controls::PlayerEmailAddress.example(sequence: sequence + 1)

        processed = player_email_address.processed?(sequence)

        test do
          assert(processed)
        end
      end

      context "Player Email Address's sequence is equal to the sequence" do
        player_email_address = Controls::PlayerEmailAddress.example(sequence: sequence)

        processed = player_email_address.processed?(sequence)

        test do
          assert(processed)
        end
      end
    end
  end
end
