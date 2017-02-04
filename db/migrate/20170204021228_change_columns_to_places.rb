class ChangeColumnsToPlaces < ActiveRecord::Migration[5.0]
  def up
    change_column :places, :name, :string, null: false
    change_column :places, :user_id, :integer, null: false

    add_index :places, [:user_id, :name], unique: true
  end

  def down
    change_column :places, :name, :string, null: true
    change_column :places, :user_id, :integer, null: true

    remove_index :places, [:user_id, :name]
  end
end
