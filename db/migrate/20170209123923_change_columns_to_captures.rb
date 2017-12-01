class ChangeColumnsToCaptures < ActiveRecord::Migration[5.0]
  def up
    rename_column :captures, :published_at, :published_on
    change_column :captures, :user_id, :integer, null: false
  end

  def down
    rename_column :captures, :published_on, :published_at
    change_column :captures, :user_id, :integer, null: true
  end
end
