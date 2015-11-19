get '/' do
  erb index
end

get '/response' do
 @responses = Response.all
 erb :'response/index'
 end

 #### New ####
 get '/response/new' do
 erb :new_response
 end

 #### Create ####
 post '/response' do
@response = Response.new(params)
if @response && response.save
redirect '/'
else
  p 'ERROR'
end

end

#### Edit ####
get '/response/:id/edit' do

  @response = Response.find(params[:id])
  erb :'response/edit'
end

#### Update ####
put '/response/:id' do

  @response = Response.find(params[:id])
  @response.update(params[:response])
  redirect '/response'
end

#### Show ####
get '/response/:id' do

  @response = Response.find(params[:id])
  erb :'response/show'
end

#### Destroy ####
delete '/response/:id' do
  @response = Response.find(params[:id])
  @response.destroy
  redirect '/response'
end



