Test to see if you have your rake commands by typing: `rake` into terminal.

```
 $ rake
=>
  rake -T: Will list all other rake tasks
  rake serve: Will run Sinatra server
  rake db:setupMCS: Will set up your database
  rake db:create: Will create a database
  rake db:migrate: Will run migrations
  rake db:drop: Will drop the database
  rake db:create_migration: Will create a migration
  rake serve: Will run
```
*If you get a warning about unresolved specs run `bundle clean --force` to cleanup any unneeded gems*

Test postgres is working with the password given to you by the instructor.

```
 $ psql -U postgres
 postgres=#

```

Type `\q` to quit postgres.

Add the username and password given to you by the instructor to the database.yml file.

Set up postgres. (Only needs to happen once.)

```
  $ rake db:setupMCS
```


Check that you can connect to your database using `irb`.  You may have to use Command Prompt instead of Git Bash for 'irb' commands.

```
 $ irb
2.3.1 :002 > require './app.rb'
 => true
2.3.1 :007 > exit
```
