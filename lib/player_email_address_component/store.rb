module PlayerEmailAddressComponent
  class Store
    include EntityStore

    category :player_email_address
    entity PlayerEmailAddress
    projection Projection
    reader MessageStore::Postgres::Read
  end
end
