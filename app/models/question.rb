class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  has_many :question_tags
  has_many :tags, through: :question_tags

  validates :title, presence: true
end
