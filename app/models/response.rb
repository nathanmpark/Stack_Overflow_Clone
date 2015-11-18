class Response < ActiveRecord::Base
  belongs_to :users
  belongs_to :answers
  belongs_to :questions
end
