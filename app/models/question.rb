class Question < ApplicationRecord

  mount_uploader :file, FileUploader

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :answers, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true


end
