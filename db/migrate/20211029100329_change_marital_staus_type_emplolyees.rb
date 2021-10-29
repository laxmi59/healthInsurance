class ChangeMaritalStausTypeEmplolyees < ActiveRecord::Migration[6.0]
  def change
    remove_column :employees, :marital_status_id
    add_column :employees, :marital_status_id, :integer, default: 1
  end
end
