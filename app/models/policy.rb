class Policy < ApplicationRecord
  has_many :cycles
  validates :name, presence: true
end
