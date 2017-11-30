class ChangeColumnDefaultToUsers < ActiveRecord::Migration[4.2]
  def change
    change_column_default :users, :tag_field, true
  end
end
