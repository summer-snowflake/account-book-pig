class ChangeColumnsToCategories < ActiveRecord::Migration[4.2][5.0]
  def up
    change_column :categories, :name, :string, null: false
    change_column :categories, :user_id, :integer, null: false
    change_column :categories, :position, :integer, null: false
    change_column :categories, :barance_of_payments, :boolean, default: false, null: false
  end

  def down
    change_column :categories, :name, :string, null: true
    change_column :categories, :user_id, :integer, null: true
    change_column :categories, :position, :integer, null: true
    change_column :categories, :barance_of_payments, :boolean, null: true
  end
end
