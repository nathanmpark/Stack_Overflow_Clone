post '/questions/:id/votes' do
  p params
  question = Question.find(params[:id])
  vote = question.votes.create(question_id: params[:id], upvote: params[:upvote])
  {question_id: vote.question_id, total_votes: question.tally_votes}.to_json
end

post '/answers/:id/votes' do

end

post '/comments/:id/votes' do

end
