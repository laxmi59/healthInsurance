class Cycle < ApplicationRecord
  belongs_to :policy
  belongs_to :location
  has_many :top_ups
  has_many :employee_cycles

  validates :cycle_year, presence: true
  validates :policy_id, presence: true
  validates :location_id, presence: true
end
