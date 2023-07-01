class MembershipsController < ApplicationController
  def create
    membership = Membership.new(membersip_params)

    if membership.save
      render json: membership, status: :ok
    else
      render json: membership.errors, status: :unprocessable_entity
    end
  end

  private

  def membersip_params
    params.permit(:gym_id, :client_id, :charge)
  end
end
