class RemovePostTypeFromNotices < ActiveRecord::Migration[5.0]
  def change
    remove_column :notices, :post_type, :string
  end
end
