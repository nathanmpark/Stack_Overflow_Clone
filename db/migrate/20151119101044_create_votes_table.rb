class CreateVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :upvote
      t.integer :question_id
      t.integer :answer_id
      t.integer :user_id
    end
  end
end
