get '/comments' do
 @comments = Comment.all
 erb :'comments/index'
end

 #### New ####
get '/comments/new' do
 erb :new_comment
end

 #### Create ####
post '/comments/:id/questions' do
  if current_user
    @comment = Comment.new(user_id:session[:id], question_id: params[:id], content: params[:content])
    if @comment.save
      redirect "/questions/#{params[:id]}"
    end
  else
    redirect '/'
  end
end


post '/comments/:id/answers' do
  if current_user
    @question_id = Answer.find(params[:id]).question_id
    @comment = Comment.new(user_id:session[:id], answer_id: params[:id], content: params[:content])
    if @comment.save
      redirect "/questions/#{@question_id}"
    end
  else
    redirect '/'
  end
end


#### Edit ####
get '/comments/:id/edit' do
  if current_user.id == params[:id]
    @comment = Comment.find(params[:id])
    erb :'comment/edit'
  end
end

#### Update ####
put '/comments/:id' do
  if current_user[:id] == params[:id]
    @comment = Comment.find(params[:id])
    @comment.update(params[:comment])
    redirect '/comments'
  else
    redirect '/'
  end
end

#### Show ####
get '/comments/:id' do

  @comment = Comment.find(params[:id])
  erb :'comments/show'
end

#### Destroy ####
delete '/comments/:id' do
  if current_user.id == params[:id]
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect '/comments'
  end
end



