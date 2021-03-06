class CreateAuths < ActiveRecord::Migration[4.2]
  def change
    create_table :auths do |t|
      t.references :user
      t.string :provider
      t.string :uid
      t.string :screen_name
      t.string :name

      t.timestamps null: false
    end
  end
end
