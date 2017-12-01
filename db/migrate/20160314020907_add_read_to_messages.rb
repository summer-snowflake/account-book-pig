class AddReadToMessages < ActiveRecord::Migration[4.2]
  def change
    add_column :messages, :read, :boolean, default: false
  end
end
