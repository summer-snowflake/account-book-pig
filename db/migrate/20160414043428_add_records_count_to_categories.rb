class AddRecordsCountToCategories < ActiveRecord::Migration[4.2]
  def self.up
    add_column :categories, :records_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :categories, :records_count
  end
end
