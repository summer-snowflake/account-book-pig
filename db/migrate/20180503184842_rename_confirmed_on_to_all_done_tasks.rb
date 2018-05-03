class RenameConfirmedOnToAllDoneTasks < ActiveRecord::Migration[5.1]
  def change
    rename_column :all_done_tasks, :confirmed_on, :confirmed_at
  end
end
