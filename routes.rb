get '/hello' do
  'Hello world!'
end

get '/users' do
  @users = User.all
  erb :"users/index"
end

get '/users/:id' do
  id = params[:id].to_i
  @user = User.find(id)
  erb :"users/show"
end
