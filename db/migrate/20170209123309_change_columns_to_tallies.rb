class ChangeColumnsToTallies < ActiveRecord::Migration[5.0]
  def up
    change_column :tallies, :user_id, :integer, null: false
    change_column :tallies, :year, :integer, null: false
    change_column :tallies, :list, :text, null: false
  end

  def down
    change_column :tallies, :user_id, :integer, null: true
    change_column :tallies, :year, :integer, null: true
    change_column :tallies, :list, :text, null: true
  end
end
