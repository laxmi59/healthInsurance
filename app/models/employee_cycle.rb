class EmployeeCycle < ApplicationRecord
  has_many :employees
  belongs_to :policy
  belongs_to :cycle
  belongs_to :top_up
end
