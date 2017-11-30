class AddCategoryIdToRecords < ActiveRecord::Migration[4.2]
  def change
    add_column :records, :category_id, :integer, after: :charge
  end
end
