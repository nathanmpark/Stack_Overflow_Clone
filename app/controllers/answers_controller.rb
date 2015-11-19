post '/answers' do
  if current_user
    @answer = Answer.new(content: params[:content], user_id: session[:id], question_id: params[:question_id])
    if @answer.save
      redirect "/questions/#{params[:question_id]}"
    else
      redirect '/'
    end
  else
    redirect '/'
  end
end

#
get '/answers/:id' do
  @answers = Answer.where(id: params[:id])

end
