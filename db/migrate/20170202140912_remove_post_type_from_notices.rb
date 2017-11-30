class RemovePostTypeFromNotices < ActiveRecord::Migration[4.2][5.0]
  def change
    remove_column :notices, :post_type, :string
  end
end
