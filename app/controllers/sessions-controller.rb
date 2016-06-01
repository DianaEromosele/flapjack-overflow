get "/login" do
  erb :"sessions/new"
end

post "/sessions" do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/"
  else
    @errors = ["Holy Flapjack! We don't have that email and password combination in our system. Give it another whirl :0)"]
    erb :"sessions/new"
  end
end

get "/logout" do
  session.clear
  redirect "/"
end
