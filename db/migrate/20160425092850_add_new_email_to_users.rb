class AddNewEmailToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :new_email, :string
  end
end
