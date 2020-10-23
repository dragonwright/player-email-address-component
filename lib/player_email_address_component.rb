require 'eventide/postgres'
require 'consumer/postgres'
require 'try'

require 'player_email_address_component/load'

require 'player_email_address_component/player_email_address'
require 'player_email_address_component/projection'
require 'player_email_address_component/store'

require 'player_email_address_component/handlers/commands'
require 'player_email_address_component/handlers/commands/transactions'

require 'player_email_address_component/consumers/commands'
require 'player_email_address_component/consumers/commands/transactions'

require 'player_email_address_component/start'
