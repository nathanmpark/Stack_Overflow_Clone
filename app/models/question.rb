class Question < ActiveRecord::Base
  has_many :comments
  has_many :answers
  has_many :votes
  belongs_to :user
end
