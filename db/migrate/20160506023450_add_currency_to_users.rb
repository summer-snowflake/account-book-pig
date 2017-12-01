class AddCurrencyToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :currency, :string
  end
end
