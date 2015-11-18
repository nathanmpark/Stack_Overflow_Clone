class Question < ActiveRecord::Base
  has_many :responses
  has_many :answers
  belongs_to :user
end
