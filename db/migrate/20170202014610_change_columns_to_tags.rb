class ChangeColumnsToTags < ActiveRecord::Migration[4.2][5.0]
  def up
    change_column :tags, :name, :string, null: false
    change_column :tags, :color_code, :string, null: false
    change_column :tags, :user_id, :integer, null: false

    add_index :tags, [:user_id, :name], unique: true
    add_index :tags, [:user_id, :color_code], unique: true
  end

  def down
    change_column :tags, :name, :string, null: true
    change_column :tags, :color_code, :string, null: true
    change_column :tags, :user_id, :integer, null: true

    remove_index :tags, [:user_id, :name]
    remove_index :tags, [:user_id, :color_code]
  end
end
