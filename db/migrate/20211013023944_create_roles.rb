class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end
    Role.insert_all([
      { id: 1, name: "Admin", created_at: :local, updated_at:  :local},
      { id: 2, name: "Employee", created_at: :local, updated_at:  :local}
    ])
  end
end
