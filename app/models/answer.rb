class Answer < ActiveRecord::Base
  # validates :user, existence: true
  # validates :question, existence: true
  has_many :votes
  has_many :comments

  belongs_to :user
  belongs_to :question
end
