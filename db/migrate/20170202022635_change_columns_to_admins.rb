class ChangeColumnsToAdmins < ActiveRecord::Migration[4.2][5.0]
  def up
    change_column :admins, :user_id, :integer, null: false
  end

  def down
    change_column :admins, :user_id, :integer, null: true
  end
end
