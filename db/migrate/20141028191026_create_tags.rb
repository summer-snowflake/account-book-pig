class CreateTags < ActiveRecord::Migration[4.2]
  def change
    create_table :tags do |t|
      t.string :name
      t.string :color_code
      t.integer :user_id
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
