class AddVoteReferenceToCommentsTable < ActiveRecord::Migration
  def change
    add_reference :comments, :vote
  end
end
