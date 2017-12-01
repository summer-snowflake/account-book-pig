class CreateAllDoneTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :all_done_tasks do |t|
      t.date :confirmed_on, null: false
      t.string :card_code, null: false
      t.string :card_name, null: false

      t.timestamps
    end
  end
end
