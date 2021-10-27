class AddGenderJobTitleToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :gender_id, :integer
    add_column :employees, :job_title, :string
    add_column :employees, :marital_status_id, :string
  end
end
