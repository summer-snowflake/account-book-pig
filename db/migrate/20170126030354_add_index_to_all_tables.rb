class AddIndexToAllTables < ActiveRecord::Migration[5.0]
  def change
    add_index :tallies, :user_id
    add_index :captures, :category_name
    add_index :captures, :breakdown_name
    add_index :captures, :place_name
    add_index :auths, :user_id
    add_index :messages, :user_id
    add_index :messages, :feedback_id
    add_index :categorize_places, :category_id
    add_index :categorize_places, :place_id
  end
end
