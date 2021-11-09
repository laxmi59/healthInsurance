class Policy < ApplicationRecord
  has_many :cycles
  has_many :employee_cycles
  
  validates :name, presence: true
end
