require_relative '../../../test_init'

context "Handle Commands" do
  context "Claim" do
    context "Not Reserved" do
      player_email_address_claim_id = Identifier::UUID::Random.get

      claim = Controls::Commands::Claim.example(id: player_email_address_claim_id)

      transaction_stream_name = "playerEmailAddressTransaction-#{player_email_address_claim_id}"

      Messaging::Postgres::Write.(claim, transaction_stream_name)

      Handlers::Commands.(claim)

      event_data, * = MessageStore::Postgres::Get.(transaction_stream_name, position: 1, batch_size: 1)

      test "Claim command is not written to transaction stream" do
        assert(event_data.nil?)
      end
    end
  end
end
