class ChangeColumnsToRecords < ActiveRecord::Migration[5.0]
  def up
    change_column :records, :published_at, :date, null: false
    change_column :records, :category_id, :integer, null: false
    change_column :records, :charge, :integer, null: false
    change_column :records, :user_id, :integer, null: false
    rename_column :records, :published_at, :published_on
  end

  def down
    change_column :records, :published_on, :date, null: true
    change_column :records, :category_id, :integer, null: true
    change_column :records, :charge, :integer, null: true
    change_column :records, :user_id, :integer, null: true
    rename_column :records, :published_on, :published_at
  end
end
