require_relative '../automated_init'

context "Projection" do
  context "Claim Rejected" do
    player_email_address = Controls::PlayerEmailAddress::Claimed.example

    projection = Projection.build(player_email_address)
    claim_rejected = Controls::Events::ClaimRejected.example

    fixture(
      EntityProjection::Fixtures::Projection,
      projection,
      claim_rejected
    ) do |fixture|
      fixture.assert_attributes_copied([
        :sequence
      ])
    end
  end
end
