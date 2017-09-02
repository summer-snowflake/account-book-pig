class AddListCodeToAllDoneTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :all_done_tasks, :list_code, :string, null: false
  end
end
