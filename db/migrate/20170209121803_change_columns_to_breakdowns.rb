class ChangeColumnsToBreakdowns < ActiveRecord::Migration[4.2][5.0]
  def up
    change_column :breakdowns, :name, :string, null: false
    change_column :breakdowns, :category_id, :integer, null: false
    remove_column :breakdowns, :user_id

    add_index :breakdowns, [:category_id, :name], unique: true
  end

  def down
    change_column :breakdowns, :name, :string, null: true
    change_column :breakdowns, :category_id, :integer, null: true
    add_reference :breakdowns, :user

    remove_index :breakdowns, [:category_id, :name]
  end
end
