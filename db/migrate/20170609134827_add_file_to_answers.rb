class AddFileToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :file, :string
  end
end
