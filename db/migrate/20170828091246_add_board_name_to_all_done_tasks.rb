class AddBoardNameToAllDoneTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :all_done_tasks, :board_name, :string, null: false
  end
end
