require_relative '../../automated_init'

context "Commands" do
  context "Claim" do
    player_email_address_claim_id = Controls::ID.example
    encoded_email_address = Controls::PlayerEmailAddress.encoded_email_address
    email_address = Controls::PlayerEmailAddress.email_address
    player_id = Controls::Player.id
    effective_time = Controls::Time::Effective::Raw.example

    claim = Commands::Claim.new
    claim.clock.now = effective_time

    claim.(
      player_email_address_claim_id: player_email_address_claim_id,
      email_address: email_address,
      player_id: player_id
    )

    write = claim.write

    claim_message = write.one_message do |written|
      written.instance_of?(Messages::Commands::Claim)
    end

    test "Claim command is written" do
      refute(claim_message.nil?)
    end

    test "Written to the player email address command stream" do
      written_to_stream = write.written?(claim_message) do |stream_name|
        stream_name == "playerEmailAddress:command-#{encoded_email_address}"
      end

      assert(written_to_stream)
    end

    context "Attributes" do
      test "player_email_address_claim_id is assigned" do
        assert(claim_message.player_email_address_claim_id == player_email_address_claim_id)
      end

      test "encoded_email_address" do
        assert(claim_message.encoded_email_address == encoded_email_address)
      end

      test "email_address" do
        assert(claim_message.email_address == email_address)
      end

      test "player_id" do
        assert(claim_message.player_id == player_id)
      end

      test "time" do
        effective_time_iso8601 = Clock.iso8601(effective_time)

        assert(claim_message.time == effective_time_iso8601)
      end
    end
  end
end
