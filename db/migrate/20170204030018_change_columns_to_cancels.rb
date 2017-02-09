class ChangeColumnsToCancels < ActiveRecord::Migration[5.0]
  def up
    change_column :cancels, :user_id, :integer, null: false
    change_column :cancels, :content, :text, null: false
  end

  def down
    change_column :cancels, :user_id, :integer, null: true
    change_column :cancels, :content, :text, null: true
  end
end
