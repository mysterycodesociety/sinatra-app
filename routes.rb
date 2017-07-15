get '/users' do
  # @users = User.all
  'Hello world'
end

get '/users/:id' do
  @user = User.find(params[:id])
  "Single User #{@user}"
end

get '/' do 
  'hello world'
end