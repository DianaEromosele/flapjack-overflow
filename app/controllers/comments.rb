get '/questions/:id/comments/new' do
  @question = Question.find_by(id: params[:id])
  erb :'comments/question-comments'
end

post '/questions/:id/comments' do
  @question = Question.find_by(id: params[:id])
  @comment = @question.comments.new(body: params[:body], user_id: session["user_id"])
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @comment.errors.full_messages
    erb :'comments/question-comments'
  end
end

get '/answers/:id/comments/new' do
  @answer = Answer.find_by(id: params[:id])
  erb :'comments/answer-comments'
end

post '/answers/:id/comments' do
  @answer = Answer.find_by(id: params[:id])
  @question = @answer.question
  @comment = @answer.comments.new(body: params[:body], user_id: session["user_id"])
  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @comment.errors.full_messages
    erb :'comments/question-comments'
  end
end
