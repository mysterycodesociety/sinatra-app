# require gems
require "sinatra"
require "sinatra/activerecord"
require "pry"

# require models
Dir["./models/*.rb"].each {|file| require file }

# require routes
require "./routes.rb"





# set database connection
# set :database_file, "./config/database.yml"
# If you have a config/database.yml, it will automatically be loaded, no need to specify it. 