class CreateTaggedRecords < ActiveRecord::Migration[4.2]
  def change
    create_table :tagged_records do |t|
      t.integer :record_id
      t.integer :tag_id
      t.integer :user_id

      t.timestamps
    end
  end
end
