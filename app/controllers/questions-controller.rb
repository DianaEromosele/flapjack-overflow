get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new', layout: false
end

post '/questions' do
  @question = Question.new(title: params['title'], body: params['body'], user_id: session['user_id'])
  if @question.save
    erb :'questions/_single', layout: false
  else
    @errors = @question.errors.full_messages
    erb :'questions/new', layout: false
  end
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  halt(404, erb(:'404')) if @question.nil?
  erb :"questions/show"
end

get '/questions/:id/edit' do
  @question = Question.find_by(id: params[:id])
  if session["user_id"] == @question.user_id
    erb :'questions/edit'
  else
    erb :'404'
  end
end

put '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  if session["user_id"] == @question.user_id
    @question.assign_attributes(title: params['title'], body: params['body'])
    if @question.save
      redirect "questions/#{@q.id}"
    else
      @errors = @question.errors.full_messages
      erb :'questions/edit'
    end
  else
    erb :'404'
  end
end

delete '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  if session["user_id"] == @question.user_id
    @question.destroy
    redirect '/questions'
  else
    erb :'404'
  end
end
