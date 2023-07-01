class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client

  validate :validate_unique_membership_per_client

  private

  def validate_unique_membership_per_client
    if client.present? && gym.present? && client.memberships.where.not(id: id, gym_id: gym_id).exists?
      errors.add(:base, "A client can only have one membership")
    end
  end
end
