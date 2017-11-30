class AddBoardNameToDoneTasks < ActiveRecord::Migration[4.2][5.1]
  def change
    add_column :done_tasks, :board_name, :string, null: false
  end
end
