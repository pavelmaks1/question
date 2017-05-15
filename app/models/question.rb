class Question < ApplicationRecord



  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :answers, dependent: :destroy
  has_many :attachments

  validates :title, presence: true
  validates :body, presence: true
  accepts_nested_attributes_for :attachments

private

end
