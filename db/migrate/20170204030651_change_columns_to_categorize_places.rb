class ChangeColumnsToCategorizePlaces < ActiveRecord::Migration[5.0]
  def up
    change_column :categorize_places, :category_id, :integer, null: false
    change_column :categorize_places, :place_id, :integer, null: false

    add_index :categorize_places, [:category_id, :place_id], unique: true
  end

  def down
    change_column :categorize_places, :category_id, :integer, null: true
    change_column :categorize_places, :place_id, :integer, null: true

    remove_index :categorize_places, [:category_id, :place_id]
  end
end
