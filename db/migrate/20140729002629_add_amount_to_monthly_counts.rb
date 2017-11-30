class AddAmountToMonthlyCounts < ActiveRecord::Migration[4.2]
  def change
    add_column :monthly_counts, :amount, :integer
  end
end
