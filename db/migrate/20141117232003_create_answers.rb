class CreateAnswers < ActiveRecord::Migration[4.2]
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :feedback_id
      t.text :content

      t.timestamps
    end
  end
end
