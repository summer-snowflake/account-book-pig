class ChangeColumnsToRecords < ActiveRecord::Migration[5.0]
  def up
    change_column :records, :published_at, :date, null: false
    change_column :records, :category_id, :integer, null: false
    change_column :records, :charge, :integer, null: false
    change_column :records, :user_id, :integer, null: false
  end

  def down
    change_column :records, :published_at, :date, null: true
    change_column :records, :category_id, :integer, null: true
    change_column :records, :charge, :integer, null: true
    change_column :records, :user_id, :integer, null: true
  end
end
