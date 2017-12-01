class AddUserIdToRecords < ActiveRecord::Migration[4.2]
  def change
    add_column :records, :user_id, :integer
  end
end
