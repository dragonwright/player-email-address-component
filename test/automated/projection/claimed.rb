require_relative '../automated_init'

context "Projection" do
  context "Claimed" do
    player_email_address = Controls::PlayerEmailAddress::New.example

    assert(player_email_address.claimed_time.nil?)

    projection = Projection.build(player_email_address)
    claimed = Controls::Events::Claimed.example

    fixture(
      EntityProjection::Fixtures::Projection,
      projection,
      claimed
    ) do |fixture|
      fixture.assert_attributes_copied([
        { :encoded_email_address => :id },
        :email_address,
        :player_id,
        :sequence
      ])

      fixture.assert_transformed_and_copied(:time => :claimed_time) { |v| Time.parse(v) }
    end
  end
end
