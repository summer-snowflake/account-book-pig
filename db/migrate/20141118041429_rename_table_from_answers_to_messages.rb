class RenameTableFromAnswersToMessages < ActiveRecord::Migration[4.2]
  def change
    rename_table :answers, :messages
  end
end
