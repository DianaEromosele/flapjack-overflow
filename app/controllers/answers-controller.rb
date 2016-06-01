# post a new answer
get '/answers/new' do
  erb :"answers/new" #partial?
end

post '/answers' do
  @question = Question.find_by(id: params[:question_id])
  # binding.pry
  @answer = @question.answers.build(body: params[:body], user_id: 1)
# binding.pry
  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @question.errors.full_messages
    erb :"answers/new"
  end
end

# edit an answer
get '/questions/:question_id/answers/:id/edit' do
  @question = Question.find_by(id: params[:question_id])
  @answer = Answer.find_by(id: params[:id])
  erb :'answers/edit' # partial?
end

put '/questions/:question_id/answers/:id' do 
  @question = Question.find_by(id: params[:question_id])
  @answer = @question.answers.find_by(id: params[:id])

  @answer.assign_attributes(params[:answer])
  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @question.errors.full_messages
    erb :'answers/edit' #partial? 
  end
end

# delete an answer
delete "/questions/:question_id/answers/:id" do
  @question = Question.find_by(id: params[:question_id])
  @answer = Answer.find_by(id: params[:id])
    @answer.destroy
    redirect "/questions/#{@question.id}"
 
end
