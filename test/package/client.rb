require 'player_email_address/client'
require 'player_email_address/client/controls'

player_email_address_claim_id = Identifier::UUID::Random.get
email_address = "test+#{player_email_address_claim_id}@test.com"
player_id = '123'

encoded_email_address = Digest::SHA256.hexdigest(email_address.downcase)

PlayerEmailAddress::Client::Claim.(
  player_email_address_claim_id: player_email_address_claim_id,
  email_address: email_address,
  player_id: player_id
)

stream_name = Messaging::StreamName.stream_name(encoded_email_address, 'playerEmailAddress')

sleep 1

claimed_data = MessageStore::Postgres::Get::Stream::Last.(stream_name)

pp claimed_data
