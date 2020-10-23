require_relative '../../automated_init'

context "Commands" do
  context "Claim" do
    context "Previous Message" do
      previous_message = Controls::Message.example

      player_email_address_claim_id = Controls::ID.example
      email_address = Controls::PlayerEmailAddress.email_address
      player_id = Controls::Player.id

      claim = Commands::Claim.new
      claim.clock.now = Controls::Time::Raw.example

      claim.(
        player_email_address_claim_id: player_email_address_claim_id,
        email_address: email_address,
        player_id: player_id,
        previous_message: previous_message
      )

      write = claim.write

      claim_message = write.one_message do |written|
        written.instance_of?(Messages::Commands::Claim)
      end

      refute(claim_message.nil?)

      test "Claim message follows previous message" do
        assert(claim_message.follows?(previous_message))
      end
    end
  end
end
