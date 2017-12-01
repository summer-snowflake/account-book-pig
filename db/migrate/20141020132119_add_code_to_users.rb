class AddCodeToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :code, :string, after: :token
  end
end
