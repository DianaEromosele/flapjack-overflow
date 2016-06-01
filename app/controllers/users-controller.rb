get "/users/new" do
  erb :"users/new"
end

post "/users" do
  @user = User.new(username: params[:username], email: params[:email], password: params[:password])
  if @user.save
    session[:user_id] = @user.id
    redirect "/"
  else
    @errors = @user.errors.full_messages
    erb :"users/new"
  end
end

get "/users/:id" do
  @user = User.find_by(id: params[:id])
  erb :"users/show"
end
