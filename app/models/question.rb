class Question < ActiveRecord::Base
  has_many :comments
  has_many :answers
  has_many :votes
  belongs_to :user

  def tally_votes
    self.votes.where(upvote: true).count - self.votes.where(upvote: false).count
  end

end
