class AddTagFieldToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :tag_field, :boolean
  end
end
