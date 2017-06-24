class RemoveColumnAuthorIdFromQuestion < ActiveRecord::Migration[5.0]
  def change
    remove_column  :questions, :author_id
  end
end
