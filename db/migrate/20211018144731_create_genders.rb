class CreateGenders < ActiveRecord::Migration[6.0]
  def change
    create_table :genders do |t|
      t.string :name

      t.timestamps
    end
    Gender.insert_all([
      { id: 1, name: "Male", created_at: Time.now, updated_at: Time.now},
      { id: 2, name: "Female", created_at: Time.now, updated_at: Time.now}
    ])
  end
end
