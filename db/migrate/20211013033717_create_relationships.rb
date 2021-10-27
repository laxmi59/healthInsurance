class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.string :name

      t.timestamps
    end
    Relationship.insert_all([
      { id: 1, name: "Father", created_at: Time.now, updated_at: Time.now},
      { id: 2, name: "Mother", created_at: Time.now, updated_at: Time.now},
      { id: 3, name: "Father In Law", created_at: Time.now, updated_at: Time.now},
      { id: 4, name: "Mother In Law", created_at: Time.now, updated_at: Time.now},
      { id: 5, name: "Spouse", created_at: Time.now, updated_at: Time.now},
      { id: 6, name: "Daughter", created_at: Time.now, updated_at: Time.now},
      { id: 7, name: "Son", created_at: Time.now, updated_at: Time.now}
    ])
  end
end
