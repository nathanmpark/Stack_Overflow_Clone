class Answer < ActiveRecord::Base
  validates :users, existence: true
  validates :questions, existence: true
  belongs_to :users
  belongs_to :questions
end
