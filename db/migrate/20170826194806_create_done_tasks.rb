class CreateDoneTasks < ActiveRecord::Migration[4.2][5.0]
  def change
    create_table :done_tasks do |t|
      t.date :end_on, null: false
      t.string :card_name, null: false

      t.timestamps
    end
  end
end
