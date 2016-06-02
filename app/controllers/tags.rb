get '/tags' do
  erb :'tags/index'
end

get '/tags/:id' do
  @tag = Tag.find_by(id: params[:id])
  erb :'tags/show'
end
