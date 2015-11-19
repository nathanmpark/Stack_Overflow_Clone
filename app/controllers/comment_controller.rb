get '/comments' do
 @comments = Comment.all
 erb :'comments/index'
 end

 #### New ####
 get '/comments/new' do
 erb :new_comment
 end

 #### Create ####
post '/comments' do
  @comment = Comment.create(params)
  @comment.content
end

#### Edit ####
get '/comments/:id/edit' do

  @comment = Comment.find(params[:id])
  erb :'comment/edit'
end

#### Update ####
put '/comments/:id' do

  @comment = Comment.find(params[:id])
  @comment.update(params[:comment])
  redirect '/comments'
end

#### Show ####
get '/comments/:id' do

  @comment = Comment.find(params[:id])
  erb :'comments/show'
end

#### Destroy ####
delete '/comments/:id' do
  @comment = Comment.find(params[:id])
  @comment.destroy
  redirect '/comments'
end



