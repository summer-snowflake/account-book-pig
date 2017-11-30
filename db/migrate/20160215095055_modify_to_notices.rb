class ModifyToNotices < ActiveRecord::Migration[4.2]
  def change
    remove_column :notices, :post_at
    add_column :notices, :post_at, :date
  end
end
