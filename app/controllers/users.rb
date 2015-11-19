require "sinatra/flash"
enable :sessions

  before '/users/:id/edit' do
    unless current_user.id == params[:id].to_i
      redirect "/questions"
    end
  end

#index
  get "/login" do
    # @user = User.find_by(params[:username], params[:password])
    erb :"/users/index"
  end

#new (can be called register) // also should I be using password_hash?
  get "/users/new" do
    # @user = User.new(params)
    erb :'/users/new'
  end

post "/users/new" do
  @user = User.new(username: params[:username], email: params[:email], password_hash: params[:password])
  @user.password = params[:password]
  if @user.save!
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    #@user.errors.full_messages
    erb :'/users/new'
  end
end

#show
get '/users/:id' do
  @user = User.find(params[:id])
  # if current_user.id == @user.id
  # session[:id] = @user.id
  erb :'/users/show'
  #else
    #flash[:error] = "Fuck off"
  # end
end

#edit
get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'/users/edit'
end


#create
  post "/login" do
    @user = User.find_by(username: params[:username])
    if @user && @user.password == params[:password]
      session[:id] = @user.id
      redirect "/users/#{@user.id}"
    else
      flash[:error] = "Username/Password is incorrect"
      redirect "/questions"
    end
  end


#edit
put '/users/:id' do
  @user = User.find(params[:id])
  @user.update(username:params[:username], email:params[:email], password:params[:password])
  redirect "/users/#{@user.id}"
end


#delete
delete '/logout' do
  session[:id] = nil
  redirect "/"
end
