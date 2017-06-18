class Answer < ApplicationRecord

  mount_uploader :answerfile, AnswerfileUploader

  validates_presence_of :body
  has_many :comments , as: :commentable
  belongs_to :author, foreign_key: 'author_id' , class_name: 'User'
  belongs_to :question
end
