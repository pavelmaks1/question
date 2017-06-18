class Question < ApplicationRecord

  mount_uploader :file, FileUploader

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :answers, dependent: :destroy
  has_many :comments , as: :commentable
  validates :title, presence: true
  validates :body, presence: true


end
