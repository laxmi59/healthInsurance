class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :email
      t.string :password_digest
      t.string :employee_name
      t.string :phone_number
      t.integer :role_id
      t.integer :is_active
      t.string :last_modified_by
      t.integer :employee_id
      t.integer :blood_group_id
      t.integer :location_id
      t.date :dob
      t.references  :blood_group_id, foreign_key: { to_table: :blood_groups}, index: true
      t.references  :location_id, foreign_key: { to_table: :locations}, index: true
      t.references  :role_id, foreign_key: { to_table: :roles}, index: true

      t.timestamps
    end
  end
end
