class ChangeColumnsToTaggedRecords < ActiveRecord::Migration[4.2][5.0]
  def up
    change_column :tagged_records, :tag_id, :integer, null: false, index: true
    change_column :tagged_records, :record_id, :integer, null: false, index: true

    add_index :tagged_records, [:record_id, :tag_id], unique: true
  end

  def down
    change_column :tagged_records, :tag_id, :integer, null: true
    change_column :tagged_records, :record_id, :integer, null: true

    remove_index :tagged_records, [:record_id, :tag_id]
  end
end
