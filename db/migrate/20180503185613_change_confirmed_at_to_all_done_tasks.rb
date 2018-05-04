class ChangeConfirmedAtToAllDoneTasks < ActiveRecord::Migration[5.1]
  def change
    change_column :all_done_tasks, :confirmed_at, :datetime
  end
end
