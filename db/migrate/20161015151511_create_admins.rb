class CreateAdmins < ActiveRecord::Migration[4.2][5.0]
  def change
    create_table :admins do |t|
      t.references :user

      t.timestamps
    end
  end
end
