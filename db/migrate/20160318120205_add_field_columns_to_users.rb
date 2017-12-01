class AddFieldColumnsToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :breakdown_field, :boolean, default: true
    add_column :users, :place_field, :boolean, default: true
    add_column :users, :memo_field, :boolean, default: true
  end
end
