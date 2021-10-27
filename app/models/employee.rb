class Employee < ApplicationRecord
  has_secure_password
  belongs_to :role
  belongs_to :location, optional: true
  belongs_to :blood_group, optional: true
  belongs_to :gender, optional: true
  belongs_to :marital_status, optional: true

  #  start validations for employee account creation by admin
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }, on: :create
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :role_id, presence: true, on: :create
  validates :employee_id, presence: true, on: :create
  #  end validations for employee account creation by admin

  #  start validations for employee account update by employee Contact details
  with_options on: :contactdetails do
    validates :phone_number,
              :location_id,
              presence: true
  end
  #  end validations for employee account update by employee Contact details

  #  start validations for employee account update by employee personal_details
  with_options on: :personal_details do
    validates :employee_name,
              :gender,
              :dob,
              :marital_status,
              :blood_group_id,
              presence: true
  end
  #  end validations for employee account update by employee personal_details

  def role_name
    self.role ? self.role.name : "N/A"
  end
  def location_name
    self.location ? self.location.name : "N/A"
  end
  def blood_group_name
    self.blood_group ? self.blood_group.name : "N/A"
  end
  def self.to_csv
     attributes = %w{id email role_name employee_id employee_name phone_number blood_group_name location_name}
     generate_csv(attributes)
  end
end
