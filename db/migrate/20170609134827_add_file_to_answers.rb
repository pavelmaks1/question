class AddFileToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :answerfile, :string
  end
end
