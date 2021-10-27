class CreateBloodGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :blood_groups do |t|
      t.string :name

      t.timestamps
    end
    BloodGroup.insert_all([
      { id: 1, name: "A+", created_at: Time.now, updated_at: Time.now},
      { id: 2, name: "B+", created_at: Time.now, updated_at: Time.now},
      { id: 3, name: "AB+", created_at: Time.now, updated_at: Time.now},
      { id: 4, name: "O+", created_at: Time.now, updated_at: Time.now},
      { id: 5, name: "A-", created_at: Time.now, updated_at: Time.now},
      { id: 6, name: "B-", created_at: Time.now, updated_at: Time.now},
      { id: 7, name: "AB-", created_at: Time.now, updated_at: Time.now},
      { id: 8, name: "O-", created_at: Time.now, updated_at: Time.now}
    ])
  end
end
