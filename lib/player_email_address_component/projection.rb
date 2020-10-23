module PlayerEmailAddressComponent
  class Projection
    include EntityProjection
    include Messages::Events

    entity_name :player_email_address

    apply Claimed do |claimed|
      SetAttributes.(player_email_address, claimed, copy: [
        { :encoded_email_address => :id },
        :email_address,
        :player_id,
        :sequence
      ])

      player_email_address.claimed_time = Clock.parse(claimed.time)
    end

    apply ClaimRejected do |claim_rejected|
      player_email_address.sequence = claim_rejected.sequence
    end
  end
end
