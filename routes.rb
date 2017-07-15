get '/hello' do
  'Hello world!'
end

get '/users' do
  @users = User.all
  erb :"users/index"
end

get '/users/:id' do
<<<<<<< HEAD
  id = params[:id]
=======
  id = params[:id].to_i
>>>>>>> Adds status after serve_your_data
  @user = User.find(id)
  erb :"users/show"
end