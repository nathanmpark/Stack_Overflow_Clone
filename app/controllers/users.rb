require "sinatra/flash"

#index
  get "/login" do
    @user = User.find_by(params[:username])
    erb :"/users/index"
  end

#show
get '/users/:id' do
  @user = User.find(params)
  session[:id]
  erb :'/users/show'
end


#create
  post "/login" do
    @user = User.find_by(params[:id])
    if @user && @user.password == params[:password]
      session[:id] = @user.id
      redirect "/users/#{@user.id}"
    else
      flash[:error] = "Username/Password is incorrect"
      redirect "/login"
    end
  end

#new
  get "users/new" do
    @user = User.new(params)
    erb :'/users/new'
  end

post "/users/new" do
  @user = User.new(params)
  @user.password = params[:password]
  if @user.save!
    redirect "users/#{@user.id}"
  else
    #@user.errors.full_messages
    erb :'/users/new'
  end
end


#edit
put '/users/edit/:id' do
  @user = User.find_by(params[:id])
  @user.update(params)
  redirect "/user/#{@user.id}"
end


#delete
delete '/logout' do
  session[:id] = nil
  redirect "/login"
end
