post '/questions/:id/upvote' do
  question = Question.find_by(id: params[:id])
  question.votes.create
  redirect "/questions/#{question.id}"
end

post '/questions/:id/downvote' do
  question = Question.find_by(id: params[:id])
  question.votes.find_by(user_id: session[:user_id]).destroy
  redirect "/questions/#{question.id}"
end

post '/answers/:id/upvote' do
  question = Question.find_by(id: params[:id])
  answer = question.answers.find_by(id: params[:id])
  answer.votes.create
  redirect "/question/#{question.id}"
end

post '/answers/:id/downvote' do
  question = Question.find_by(id: params[:id])
  answer = question.answers.find_by(id: params[:id])
  answer.votes.find_by(user_id: session[:user_id]).destroy
  redirect "/questions/#{question.id}"
end
