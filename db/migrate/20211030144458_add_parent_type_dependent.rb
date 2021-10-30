class AddParentTypeDependent < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :parent_type, :integer, default: 1
  end
end
