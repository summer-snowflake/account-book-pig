class RemoveAdminFromUsers < ActiveRecord::Migration[4.2][5.0]
  def change
    remove_column :users, :admin
  end
end
