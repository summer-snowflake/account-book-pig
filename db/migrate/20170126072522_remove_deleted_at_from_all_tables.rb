class RemoveDeletedAtFromAllTables < ActiveRecord::Migration[4.2][5.0]
  def change
    remove_column :messages, :deleted_at, :timestamp
    remove_column :notices, :deleted_at, :timestamp
    remove_column :feedbacks, :deleted_at, :timestamp
    remove_column :categories, :deleted_at, :timestamp
    remove_column :breakdowns, :deleted_at, :timestamp
    remove_column :tags, :deleted_at, :timestamp
    remove_column :records, :deleted_at, :timestamp
  end
end
