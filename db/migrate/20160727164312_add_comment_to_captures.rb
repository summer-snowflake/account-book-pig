class AddCommentToCaptures < ActiveRecord::Migration[4.2][5.0]
  def change
    add_column :captures, :comment, :text
  end
end
