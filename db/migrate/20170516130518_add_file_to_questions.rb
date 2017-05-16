class AddFileToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :file, :string
  end
end
