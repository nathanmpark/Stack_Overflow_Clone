#RESTful Routes

# get '/answers' do

#   erb :
# end

# The form for this route will be on the question.erb page
# get '/answers/new' do

# end

post '/answers' do
  # we will ajax this
  # current_user
  @current_user = User.find(session[:user_id])
  # put answer in the DB
  #   - params[:content]
  #   - question_id needs to be in the form!!
  @answer = Answer.new(content: params[:content], user_id: session[:user_id], question_id: params[:question_id])
  if @answer.save
    return @answer.to_json
  else
    # ??@error = error.full_message
    # Add @errors if statement above answer form on index page
    erb :questions
  end
end


get '/answers/:id' do

end



# routes for beyond MVP
# get '/answers/:id/edit' do

# end

# put '/answers/:id'

# end
# delete '/answers/:id' do

# end
