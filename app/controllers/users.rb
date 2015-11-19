require "sinatra/flash"
enable :sessions

#index
  get "/login" do
    # @user = User.find_by(params[:username], params[:password])
    erb :"/users/index"
  end

#show
get '/users/:id' do
  @user = User.find(params[:id])
  # if current_user.id == @user.id
  session[:id]
  erb :'/users/show'
  #else
    #flash[:error] = "Fuck off"
  # end
end


#create
  post "/login" do
    @user = User.find_by(username: params[:username])
    if @user && @user.password == params[:password]
      session[:id] = @user.id
      redirect "/users/#{@user.id}"
    else
      flash[:error] = "Username/Password is incorrect"
      redirect "/login"
    end
  end

#new (can be called register) // also should I be using password_hash?
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
  @user = User.find(params[:id])
  @user.update(params)
  redirect "/user/#{@user.id}"
end


#delete
delete '/logout' do
  session[:id] = nil
  redirect "/login"
end
