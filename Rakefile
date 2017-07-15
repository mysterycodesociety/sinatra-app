require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require './app'

namespace :db do
  task :load_config do
    require "./app"
  end
  
  desc "Set up the Cloud 9 environment"
  task :setupC9 do
    db_config       = YAML::load(File.open('./config/database.yml'))
    db_config_admin = db_config.merge({'database' => 'postgres', 'schema_search_path' => 'public'})
    ActiveRecord::Base.establish_connection(db_config_admin)
    # template1 is what activerecord uses to make new databases
    # template0 and template1 in Cloud9 are SQL_ASCII instead of unicode
    # Make template1 not a template, drop it, and recreate it as unicode
    sql = []
    #  make template1 not a template anymore
    sql << "UPDATE pg_database SET datistemplate = FALSE WHERE datname = 'template1';"
    # drop template1
    sql << "DROP DATABASE template1;"
    # create template1 as a utf-8 encoded database
    sql << "CREATE DATABASE template1 WITH template = template0 encoding = 'UTF8';"
    # make template 1 a template
    sql << "UPDATE pg_database SET datistemplate = TRUE WHERE datname = 'template1';"
    sql.each do |s|
      ActiveRecord::Base.connection.execute(s)
    end
    puts "Cloud9 setup."
  end
end
  


task :default do 
  options = { 
              "rake -T": "Will list all other rake tasks.",
              "rake db:setupC9": "Will set up cloud 9",
              "rake db:create": "Will create a database",
              "rake db:migrate": "Will run migrations", 
              "rake db:drop": "Will drop the database",
              "rake db:create_migration": "Will create a migration" 
            }
  options.each do |h, v|
    puts "#{h}: #{v}"
  end
end