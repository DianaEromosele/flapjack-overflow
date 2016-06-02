post '/questions/:id/upvote' do
  question = Question.find_by(id: params[:id])
  question.votes.create(user_id: session['user_id'])
  redirect "/questions/#{question.id}"
end

post '/questions/:id/downvote' do
  question = Question.find_by(id: params[:id])
  vote = question.votes.find_by(user_id: session[:user_id])
  vote.destroy if vote
  redirect "/questions/#{question.id}"
end

post '/answers/:id/upvote' do
  answer = Answer.find_by(id: params[:id])
  answer.votes.create(user_id: session['user_id'])
  redirect "/question/#{question.id}"
end

post '/answers/:id/downvote' do
  answer = Answer.find_by(id: params[:id])
  vote answer.votes.find_by(user_id: session[:user_id])
  vote.destroy if vote
  redirect "/questions/#{question.id}"
end
