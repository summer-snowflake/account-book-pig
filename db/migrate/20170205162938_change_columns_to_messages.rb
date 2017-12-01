class ChangeColumnsToMessages < ActiveRecord::Migration[5.0]
  def up
    change_column :messages, :user_id, :integer, null: false
    change_column :messages, :content, :text, null: false
    change_column :messages, :sent_at, :datetime, null: false
    change_column :messages, :read, :boolean, null: false
    remove_column :messages, :type, :string
  end

  def down
    change_column :messages, :user_id, :integer, null: true
    change_column :messages, :content, :text, null: true
    change_column :messages, :sent_at, :datetime, null: true
    change_column :messages, :read, :boolean, null: true
    add_column :messages, :type, :string
  end
end
