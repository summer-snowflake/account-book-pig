class ChangeColumnsToAuths < ActiveRecord::Migration[4.2][5.0]
  def up
    change_column :auths, :user_id, :integer, null: false
    change_column :auths, :provider, :string, null: false
  end

  def down
    change_column :auths, :user_id, :integer, null: true
    change_column :auths, :provider, :string, null: true
  end
end
