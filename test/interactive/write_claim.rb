require_relative './interactive_init'

player_email_address_claim_id = Identifier::UUID::Random.get

email_address = 'test@test.com'

player_id = '123'

Controls::Write::Claim.(
  id: player_email_address_claim_id,
  email_address: email_address,
  player_id: player_id
)
