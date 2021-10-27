class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name

      t.timestamps
    end
    Location.insert_all([
      { id: 1, name: "Hyderabad", created_at: Time.now, updated_at: Time.now},
      { id: 2, name: "Chennai", created_at: Time.now, updated_at: Time.now},
      { id: 3, name: "Bengaluru", created_at: Time.now, updated_at: Time.now}
    ])
  end
end
