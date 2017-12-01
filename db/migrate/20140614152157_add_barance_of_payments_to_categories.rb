class AddBaranceOfPaymentsToCategories < ActiveRecord::Migration[4.2]
  def change
    add_column :categories, :barance_of_payments, :boolean
  end
end
