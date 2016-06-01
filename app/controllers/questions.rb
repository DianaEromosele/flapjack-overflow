get '/questions' do
  @qs = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new', layout: false
end

post '/questions' do
  @q = Question.new(title: params['title'], body: params['body'], user_id: 1)
  if @q.save
    erb :'questions/_single', layout: false
  else
    @errors = @q.errors.full_messages
    erb :'questions/new', layout: false
  end
end

get '/questions/:id' do
  @q = Question.find_by(id: params[:id])
  halt(404, erb(:'404')) if @q.nil?
  erb :"questions/show"
end

get '/questions/:id/edit' do
  @q = Question.find_by(id: params[:id])
    erb :'questions/edit'
end

put '/questions/:id' do
  @q = Question.find_by(id: params[:id])
    @q.assign_attributes(title: params['title'], body: params['body'])
    if @q.save
      redirect "questions/#{@q.id}"
    else
      @errors = @q.errors.full_messages
      erb :'questions/edit'
    end
end

delete '/questions/:id' do
  @q = Question.find_by(id: params[:id])
    @q.destroy
    redirect '/questions'
end
