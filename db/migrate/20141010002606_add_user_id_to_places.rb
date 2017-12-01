class AddUserIdToPlaces < ActiveRecord::Migration[4.2]
  def change
    add_column :places, :user_id, :integer
  end
end
