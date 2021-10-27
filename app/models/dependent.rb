class Dependent < ApplicationRecord
  belongs_to :employee
  belongs_to :relationship
  belongs_to :cycle, optional: true
  belongs_to :policy, optional: true
  belongs_to :action_type

  validates :dependent_name, presence: true
  validates :relationship_id, presence: true
  validates :dob, presence: true
  #validates :cycle_id, presence: true
  validates :action_type_id, presence: true
  #validates :policy_id, presence: true
end
