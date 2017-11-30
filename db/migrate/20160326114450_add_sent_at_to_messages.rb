class AddSentAtToMessages < ActiveRecord::Migration[4.2]
  def change
    add_column :messages, :sent_at, :timestamp
  end
end
