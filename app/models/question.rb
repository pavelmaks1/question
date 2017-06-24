class Question < ApplicationRecord

  mount_uploader :file, FileUploader

  has_many :answers, dependent: :destroy
  has_many :comments , as: :commentable

  validates :title, presence: true
  validates :body, presence: true


end
