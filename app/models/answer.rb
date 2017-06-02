class Answer < ApplicationRecord
  validates_presence_of :body
  belongs_to :author, foreign_key: 'author_id' , class_name: 'User'
  belongs_to :question
end
