class AddPlaceIdToRecords < ActiveRecord::Migration[4.2]
  def change
    add_column :records, :place_id, :integer, after: :breakdown_id
  end
end
