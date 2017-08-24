Test to see if you have your rake commands by typing: `rake` into terminal.

```
 $ rake
=>
  rake -T: Will list all other rake tasks
  rake serve: Will run Sinatra server
  rake db:setupC9: Will set up your Cloud 9 workspace
  rake db:create: Will create a database
  rake db:migrate: Will run migrations
  rake db:drop: Will drop the database
  rake db:create_migration: Will create a migration
  rake serve: Will run
```

Test postgres is working.

```
 $ psql
 ubuntu=#

```

Type `\q` to quit postgres.


Set up postgres for Cloud9. (Only needs to happen once.)

```
  $ rake db:setupC9
```


Check that you can connect to your database using `irb`.

```
 $ irb
2.3.1 :002 > require './app.rb'
 => true
2.3.1 :007 > exit
```