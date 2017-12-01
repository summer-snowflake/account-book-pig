class CreateFeedbacks < ActiveRecord::Migration[4.2]
  def change
    create_table :feedbacks do |t|
      t.text :content
      t.integer :user_id
      t.boolean :checked
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
