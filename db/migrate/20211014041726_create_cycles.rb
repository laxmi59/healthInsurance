class CreateCycles < ActiveRecord::Migration[6.0]
  def change
    create_table :cycles do |t|
      t.string :created_by
      t.string :last_modified_by
      t.integer :roll_out
      t.integer :status
      t.string :cycle_year
      t.integer :policy_id
      t.integer :location_id
      t.integer :isCurrent

      t.timestamps
    end
  end
end
