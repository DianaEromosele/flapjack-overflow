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
  @questions = @user.questions.order("created_at desc")
  erb :"users/show"
end


# Edit a user account
get "/users/:id/edit" do
  @user = User.find_by(id: params[:id])
  erb :"users/edit"
end

put "/users/:id" do
  @user = User.find_by(id: params[:id])
  @user.assign_attributes(username: params[:username], email: params[:email], password: params[:password])
  if @user.save
    redirect "/users/#{@user.id}"
  else 
    erb :"users/edit"
  end
end
