class Answer < ApplicationRecord

  mount_uploader :file, FileUploader

  validates_presence_of :body
  belongs_to :author, foreign_key: 'author_id' , class_name: 'User'
  belongs_to :question
end
