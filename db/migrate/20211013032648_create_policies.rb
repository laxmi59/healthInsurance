class CreatePolicies < ActiveRecord::Migration[6.0]
  def change
    create_table :policies do |t|
      t.string :name
      t.string :last_modified_by

      t.timestamps
    end
    Policy.insert_all([
      { id: 1, name: "Group Medical Insurance Policy", last_modified_by: "", created_at: Time.now, updated_at: Time.now},
      { id: 2, name: "Group Personal Accident Policy", last_modified_by: "", created_at: Time.now, updated_at: Time.now}
    ])
  end
end
