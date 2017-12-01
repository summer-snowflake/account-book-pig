class ChangeEmailOptionOnUsers < ActiveRecord::Migration[4.2]
  def change
    # remove_column :users, :email
    # add_column :users, :email, :string, null: true, after: :id
    change_column :users, :email, :string, null: true
    remove_index :users, :email
  end
end
