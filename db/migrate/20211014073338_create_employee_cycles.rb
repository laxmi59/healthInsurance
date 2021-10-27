class CreateEmployeeCycles < ActiveRecord::Migration[6.0]
  def change
    create_table :employee_cycles do |t|
      t.integer :employee_id
      t.integer :top_up_id
      t.integer :marital_status_id
      t.integer :cycle_id
      t.integer :policy_id
      t.string :last_modified_by
      t.integer :is_opted
      #t.references  :policy, foreign_key: { to_table: :policies}, index: true
      #t.references  :top_up, foreign_key: { to_table: :top_ups}, index: true
      #t.references  :marital_status, foreign_key: { to_table: :marital_statuses}, index: true
      #t.references  :employee, foreign_key: { to_table: :employees}, index: true
      #t.references  :cycle, foreign_key: { to_table: :cycles}, index: true
      t.timestamps
    end
  end
end
