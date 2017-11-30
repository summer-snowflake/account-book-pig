class RemoveUserIdFromTaggedRecords < ActiveRecord::Migration[4.2][5.0]
  def change
    remove_column :tagged_records, :user_id
  end
end
