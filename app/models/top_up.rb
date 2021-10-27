class TopUp < ApplicationRecord
  belongs_to :cycle
  belongs_to :location

  validates :cycle_id, presence: true
  validates :coverage, presence: true
  validates :amount_deductable, presence: true
  validates :location_id, presence: true
  validates :description, presence: true
end
