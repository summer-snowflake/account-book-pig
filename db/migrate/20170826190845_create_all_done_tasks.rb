class CreateAllDoneTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :all_done_tasks do |t|
      t.date :confirmed_on
      t.string :card_code
      t.string :card_name

      t.timestamps
    end
  end
end
