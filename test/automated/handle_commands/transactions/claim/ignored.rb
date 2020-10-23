require_relative '../../../automated_init'

context "Handle Commands" do
  context "Transactions" do
    context "Claim" do
      context "Ignored" do
        handler = Handlers::Commands::Transactions.new
        claim = Controls::Commands::Claim.example

        player_email_address = Controls::PlayerEmailAddress::Sequence.example

        assert(player_email_address.processed?(claim.metadata.global_position))

        fixture(
          Messaging::Fixtures::Handler,
          handler,
          claim,
          player_email_address
        ) do |handler|
          handler.refute_write
        end
      end
    end
  end
end
