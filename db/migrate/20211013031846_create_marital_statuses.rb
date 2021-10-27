class CreateMaritalStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :marital_statuses do |t|
      t.string :name

      t.timestamps
    end
    MaritalStatus.insert_all([
      { id: 1, name: "Single", created_at: Time.now, updated_at: Time.now},
      { id: 2, name: "Married", created_at: Time.now, updated_at: Time.now}
    ])
  end
end
