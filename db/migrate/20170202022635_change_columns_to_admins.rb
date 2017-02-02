class ChangeColumnsToAdmins < ActiveRecord::Migration[5.0]
  def up
    change_column :admins, :user_id, :integer, null: false
    add_index :admins, :user_id, unique: true
  end

  def down
    change_column :admins, :user_id, :integer, null: true
    remove_index :admins, :user_id
  end
end
