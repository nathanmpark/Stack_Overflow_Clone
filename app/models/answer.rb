class Answer < ActiveRecord::Base
  # validates :user, existence: true
  # validates :question, existence: true

  belongs_to :users
  belongs_to :questions
end
