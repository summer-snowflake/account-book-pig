class AddPlacesCountToCategories < ActiveRecord::Migration[4.2]
  def self.up
    add_column :categories, :places_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :categories, :places_count
  end
end
