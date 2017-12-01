class CreateCancels < ActiveRecord::Migration[4.2]
  def change
    create_table :cancels do |t|
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
