class CreateNotices < ActiveRecord::Migration[4.2]
  def change
    create_table :notices do |t|
      t.string :title
      t.text :content
      t.string :post_type
      t.timestamp :post_at
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
