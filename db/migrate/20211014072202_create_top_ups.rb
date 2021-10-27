class CreateTopUps < ActiveRecord::Migration[6.0]
  def change
    create_table :top_ups do |t|
      t.integer :coverage
      t.integer :amount_deductable
      t.integer :cycle_id
      t.string :created_by
      t.string :last_modified_by
      t.integer :location_id
      t.string :description
      #t.references  :cycle, foreign_key: { to_table: :cycles}, index: true
      #t.references  :location, foreign_key: { to_table: :locations}, index: true
      t.timestamps
    end
  end
end
