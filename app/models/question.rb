class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates :title, presence: true
end
