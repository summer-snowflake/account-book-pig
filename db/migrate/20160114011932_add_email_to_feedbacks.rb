class AddEmailToFeedbacks < ActiveRecord::Migration[4.2]
  def change
    add_column :feedbacks, :email, :string, after: :user_id
  end
end
