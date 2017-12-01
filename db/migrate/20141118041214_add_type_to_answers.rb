class AddTypeToAnswers < ActiveRecord::Migration[4.2]
  def change
    add_column :answers, :type, :string, after: :content
  end
end
