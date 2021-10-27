class CreateDependents < ActiveRecord::Migration[6.0]
  def change
    create_table :dependents do |t|
      t.string :dependent_name
      t.integer :relationship_id
      t.date  :dob
      t.integer :is_active
      t.integer :employee_id
      t.string :last_modified_by
      t.string :created_by
      t.integer :cycle_id
      t.integer :action_type_id
      t.integer :policy_id
      #t.references  :cycle, foreign_key: { to_table: :cycles}, index: true
      #t.references  :action_type, foreign_key: { to_table: :action_types}, index: true
      # t.references  :employee, foreign_key: { to_table: :employes}, index: true
      # t.references  :policy, foreign_key: { to_table: :policies}, index: true
      # t.references  :relationship, foreign_key: { to_table: :relationships}, index: true
      t.timestamps
    end
  end
end
