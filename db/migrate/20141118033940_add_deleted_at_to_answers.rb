class AddDeletedAtToAnswers < ActiveRecord::Migration[4.2]
  def change
    add_column :answers, :deleted_at, :timestamp, after: :content
  end
end
