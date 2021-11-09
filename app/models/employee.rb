class Employee < ApplicationRecord
  has_secure_password
  belongs_to :role
  belongs_to :location, optional: true
  belongs_to :blood_group, optional: true
  belongs_to :gender, optional: true
  belongs_to :marital_status, optional: true
  belongs_to :employee_cycle, optional: true

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

  def employee_role
    self.role ? self.role.name : "N/A"
  end
  def location_name
    self.location ? self.location.name : "N/A"
  end
  def employee_blood_group
    self.blood_group ? self.blood_group.name : "N/A"
  end
  def employee_gender
    self.gender ? self.gender.name : "N/A"
  end
  def employee_marital_status
    self.marital_status ? self.marital_status.name : "N/A"
  end
  def self.to_csv
     attributes = %w{id email employee_role dob employee_gender job_title employee_marital_status employee_id employee_name phone_number employee_blood_group location_name}
     generate_csv(attributes)
  end


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      employee_hash = Employee.new
      employee_hash.email = row[0]
      employee_hash.password = row[1]
      employee_hash.password_confirmation = row[2]
      employee_hash.role_id = row[3]
      employee_hash.is_active = row[4]
      employee_hash.last_modified_by = row[5]
      employee_hash.employee_id = row[6]
      employee_hash.job_title = row[7]
      employee_hash.save
    end
  end
end
