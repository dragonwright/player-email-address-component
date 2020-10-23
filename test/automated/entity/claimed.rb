require_relative '../automated_init'

context "Player Email Address" do
  context "Has Claimed Time" do
    player_email_address = Controls::PlayerEmailAddress::Claimed.example

    test "Is claimed" do
      assert(player_email_address.claimed?)
    end
  end

  context "Does not Have Claimed Time" do
    player_email_address = Controls::PlayerEmailAddress::New.example

    test "Is not claimed" do
      refute(player_email_address.claimed?)
    end
  end
end
