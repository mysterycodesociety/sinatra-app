get '/hello' do
  'Hello world!'
end

get '/users' do
  @users = User.all
  erb :"users/index"
end

get '/users/new' do
  @user = User.new
  erb :"users/new"
end

post '/users' do
  # params => { name: "cora", email: "t@t.com", salutation: "hi there!" }
  @user = User.create(name: params["name"], email: params["email"], salutation: params["salutation"])
  redirect to("users/#{@user.id}")
end

get '/users/:id' do
  id = params[:id].to_i
  @user = User.find(id)
  erb :"users/show"
end

get '/users/:id/edit' do
  id = params[:id].to_i
  @user = User.find(id)
  erb :"users/edit"
end

put '/users/:id' do
  id = params[:id].to_i
  @user = User.find(id)
  # params => { id: "1", name: "cora", email: "t@t.com", salutation: "hi there!" }

  @user.update(name: params["name"], email: params["email"], salutation: params["salutation"])
  redirect to("users/#{@user.id}")
end

delete '/users/:id' do
  id = params[:id].to_i
  @user = User.find(id)
  @user.destroy  redirect to("/users")

end

# Tweets

get '/users/:user_id/tweets' do
  user_id = params[:user_id].to_i
  @user = User.find(user_id)
  @tweets = @user.tweets
  erb :"users/index"
end

get '/users/:user_id/tweets/new' do
  user_id = params[:user_id].to_i
  @user = User.find(user_id)
  @tweet = Tweet.new(user: @user)
  erb :"tweets/new"
end

post '/users/:user_id/tweets' do
  user_id = params[:user_id].to_i
  @user = User.find(user_id)
  # params => { content: "cora" }
  @tweet = Tweet.create(content: params["content"], date: Date.today, user: @user)
  redirect to("users/#{@user.id}")
end

get '/users/:user_id/tweets/:id' do
  user_id = params[:user_id].to_i
  @user = User.find(user_id)
  id = params[:id].to_i
  @tweet = Tweet.find(id)
  erb :"tweets/show"
end

get '/users/:user_id/tweets/:id/edit' do
  user_id = params[:user_id].to_i
  @user = User.find(user_id)
  id = params[:id].to_i
  @tweet = Tweet.find(id)

  erb :"tweets/edit"
end

put '/users/:user_id/tweets/:id' do
  user_id = params[:user_id].to_i
  @user = User.find(user_id)
  id = params[:id].to_i
  @tweet = Tweet.find(id)

  # params => { id: "1", name: "cora", email: "t@t.com", salutation: "hi there!" }
  @tweet.update(content: params["content"], date: Date.today)
  redirect to("users/#{@user.id}")
end

delete '/users/:user_id/tweets/:id' do
  user_id = params[:user_id].to_i
  @user = User.find(user_id)
  id = params[:id].to_i
  @tweet = Tweet.find(id)

  @tweet.destroy  
  redirect to("/users/#{@user.id}")
end