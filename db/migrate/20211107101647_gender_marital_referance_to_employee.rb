class GenderMaritalReferanceToEmployee < ActiveRecord::Migration[6.0]
  def change
    remove_column :employees, :genders_id
    remove_column :employees, :marital_statuses_id

    add_column :employees, :gender_id, :integer
    add_column :employees, :marital_status_id, :integer, default: 1

    add_reference :employees, :gender, foreign_key: true
    add_reference :employees, :marital_status, foreign_key: true
  end
end
