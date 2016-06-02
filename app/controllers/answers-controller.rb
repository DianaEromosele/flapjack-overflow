# post a new answer
get '/questions/:question_id/answers/new' do
  @question = Question.find_by(id: params[:question_id])
  erb :"answers/_answer-form", layout: false
end

post '/questions/:question_id/answers' do
  @question = Question.find_by(id: params[:question_id])
  # binding.pry
  @answer = @question.answers.build(body: params[:body], user_id: session['user_id'])
# binding.pry
  if request.xhr? && @answer.save
    erb :"answers/_single-answer", layout: false, locals: {answer: @answer}
  else
    @errors = @question.errors.full_messages
    erb :"answers/new"
  end
end

# edit an answer
get '/questions/:question_id/answers/:id/edit' do
  @question = Question.find_by(id: params[:question_id])
  @answer = Answer.find_by(id: params[:id])
  erb :'answers/_edit_answer', layout: false
end

put '/questions/:question_id/answers/:id' do
  @question = Question.find_by(id: params[:question_id])
  @answer = @question.answers.find_by(id: params[:id])

  @answer.assign_attributes(params[:answer])
  if request.xhr? && @answer.save
    erb :"answers/_edit_answer", layout: false, locals: {answer: @answer, question: @question}
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
