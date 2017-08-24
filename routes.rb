get '/hello' do
  'Hello world!'
end

get '/users' do
  @users = User.all
  erb :"users/index"
end

get '/users/:id' do
<<<<<<< HEAD
<<<<<<< HEAD
  id = params[:id]
=======
  id = params[:id].to_i
>>>>>>> Adds status after serve_your_data
=======
  id = params[:id]
>>>>>>> Updates to match master
  @user = User.find(id)
  erb :"users/show"
end