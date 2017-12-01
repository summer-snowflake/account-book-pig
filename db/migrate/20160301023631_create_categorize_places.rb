class CreateCategorizePlaces < ActiveRecord::Migration[4.2]
  def change
    create_table :categorize_places do |t|
      t.integer :category_id
      t.integer :place_id

      t.timestamps null: false
    end
  end
end
