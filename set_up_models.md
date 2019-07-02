In this exercise, we are going to set up two models.  

1. Users will have a name, a salutation, and an email.
1. Tweets will have a content, a date, and will belong to a user.

To set these up, we need to create the database, set up a migration for each table, and create a class for each table that inherits from ActiveRecord.

1. Create the database.  

Type `rake` into terminal to get the rake commands.  Find the command that creates the database and run it.

```
 $ rake
=> 
  rake -T: Will list all other rake tasks.
  rake db:setupMCS: Will set up the MCS database
  rake db:create: Will create a database
  rake db:migrate: Will run migrations
  rake db:drop: Will drop the database
  rake db:create_migration: Will create a migration
```


1. Let's create a migration for the Users table.

Type `rake` into terminal to get the rake commands. Find the command for creating a migration and type it in.  (Remember that you typically need to name your migration, such as 'create_users' following the rake command.)

1. Find the new migration file in the `db/migrate` folder and open it up.  If it opens and then immediately closes, then open it in your ide.  It should look someting like below.


```
class CreateUsers < ActiveRecord::Migration[5.1]
  def change
  end
end

```

Now let's add the code we need to define the users table.  We know that there are three attributes for a user: name, salutation, and email.

```
class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :salutation
      t.string :email
    end
  end
end

```

Save and close the file.  

1. Run the migration.

Type `rake` into terminal to get the rake commands. Find the command to _run_ a migration.  Run it.  Stuff should happen that looks like this.

```
➜  sinatra-app git:(master) ✗ rake db:migrate
== 20170715104833 CreateUsers: migrating =======================================
-- create_table(:users)
   -> 0.0056s
== 20170715105752 CreateTweets: migrated (0.0186s) ============================
```

1. The table exists in the database.  Now we need to let ActiveRecord know that it exists by creating a class by the singular name of the table.

(In ActiveRecord, tables are always plural, and class names are always singular.  And it's smart enough to know English pluralization rules, like that the plural of 'deer' is 'deer', etc.).

Create a new file inside the `models` folder and call it the same name as the class: `user.rb`.  Always use `.rb` as the extension because it's a ruby file.


1. Open up the file.  We will declare our User class here, and it will inherit from ActiveRecord::Base.

```
class User < ActiveRecord::Base
end

```

Save and close the file.  Test that you have hooked activerecord up right by going into `irb` and see if you can create a new user record.

```
➜  sinatra-app git:(master) ✗ irb
2.3.1 :001 > require './app.rb'
 => true 
2.3.1 :002 > User
 => User (call 'User.connection' to establish a connection) 
2.3.1 :003 > a = User.new
 => #<User id: nil, name: nil, email: nil, salutation: nil> 
2.3.1 :004 > a.name = 'Wendy'
 => "Wendy" 
2.3.1 :005 > a.email = 'gmfholley@gmail.com'
 => "gmfholley@gmail.com" 
2.3.1 :006 > a.salutation = 'Yo Wendy!'
 => "Yo Wendy!" 
2.3.1 :007 > a.save
D, [2017-07-15T05:55:14.170760 #48934] DEBUG -- :    (0.2ms)  BEGIN
D, [2017-07-15T05:55:14.180182 #48934] DEBUG -- :   SQL (2.9ms)  INSERT INTO "users" ("name", "email", "salutation") VALUES ($1, $2, $3) RETURNING "id"  [["name", "Wendy"], ["email", "gmfholley@gmail.com"], ["salutation", "Yo Wendy!"]]
D, [2017-07-15T05:55:14.180751 #48934] DEBUG -- :    (0.3ms)  COMMIT
 => true 
2.3.1 :008 > exit
➜  sinatra-app git:(master) ✗ 
```

Great!  Now let's create the Tweet class.

1. Create a migration for the tweet class.

Type `rake` into terminal to get the rake commands. Find the command for creating a migration and type it in.  (Remember that you typically need to name your migration.)


1. Find the new migration file in the `db/migrate` folder and open it up.  It should look someting like below.

```
class CreateTweets < ActiveRecord::Migration[5.1]
  def change
  end
end

```

Add code to create the tweets table with: a) content, b) date, c) foreign key reference to user (a tweet belogns to a user.)

```
class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.string :content
      t.datetime :date
      t.references :user
    end
  end
end
```

Save and close the file.

1. Run the migration.

Type `rake` into terminal to get the rake commands. Find the command to _run_ a migration.  Run it.  Stuff should happen that looks like this.

```
➜  sinatra-app git:(master) ✗ rake db:migrate
== 20170715105752 CreateTweets: migrating =====================================
-- create_table(:tweets)
   -> 0.0185s
== 20170715105752 CreateTweets: migrated (0.0186s) ============================
```

1. The table exists in the database.  Now we need to let ActiveRecord know that it exists by creating a class by the singular name of the table.


Create a new file inside the `models` folder and call it the same name as the class: `tweet.rb`.  


1. Open up the file.  We will declare our Tweet class here, and it will inherit from ActiveRecord::Base.

```
class Tweet < ActiveRecord::Base
end
```

We also need to add our relationships so that active record knows how to join them the users table and the tweets tables.
```
class Tweet < ActiveRecord::Base
  belongs_to :user
end

```

We need to make the relationship reciprocal.  So open the `user.rb` file now, and let's add the relationship to tweets.


```
class User < ActiveRecord::Base
  has_many :tweets
end
```

Save and close both files.  

1. Now let's test it in irb to see if we have the changes.

```
sinatra-app git:(master) ✗ irb
2.3.1 :001 > require './app.rb'
 => true 
2.3.1 :002 > a = User.find(1)
D, [2017-07-15T06:14:00.860738 #49266] DEBUG -- :   User Load (0.3ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 1], ["LIMIT", 1]]
 => #<User id: 1, name: "Wendy", email: "gmfholley@gmail.com", salutation: "Yo Wendy!"> 
```

ClassName.find(id) => will return you the record with that id.  So now we have the user we created.

```
2.3.1 :003 > b = Tweet.new
 => #<Tweet id: nil, content: nil, date: nil, user_id: nil> 
2.3.1 :004 > b.content = 'My first ever tweet!  Yay!'
 => "My first ever tweet!  Yay!" 
2.3.1 :005 > b.date = Date.today
 => Sat, 15 Jul 2017 
2.3.1 :006 > b.user = a
 => #<User id: 1, name: "Wendy", email: "gmfholley@gmail.com", salutation: "Yo Wendy!"> 
2.3.1 :007 > b.save
D, [2017-07-15T06:14:26.212398 #49266] DEBUG -- :    (0.3ms)  BEGIN
D, [2017-07-15T06:14:26.214639 #49266] DEBUG -- :   SQL (0.8ms)  INSERT INTO "tweets" ("content", "date", "user_id") VALUES ($1, $2, $3) RETURNING "id"  [["content", "My first ever tweet!  Yay!"], ["date", "2017-07-15"], ["user_id", 1]]
D, [2017-07-15T06:14:26.217168 #49266] DEBUG -- :    (2.1ms)  COMMIT
 => true 
```

Save a new tweet.  Notice that we didn't even have to assign the the user with the name of the column, user_id.  We were able to save `b.user = a` and activerecord was smart enough to figure that out because we added the associatoins.


Now we can also use activerecord conventions.  We can save `a.tweets`, and it should return an array of tweets for that user.

We can say `b.user`, and it should return to us an object of that user.
```
2.3.1 :008 > b.user
 => #<User id: 1, name: "Wendy", email: "gmfholley@gmail.com", salutation: "Yo Wendy!"> 
2.3.1 :009 > a.tweets
D, [2017-07-15T06:14:31.711763 #49266] DEBUG -- :   Tweet Load (0.3ms)  SELECT  "tweets".* FROM "tweets" WHERE "tweets"."user_id" = $1 LIMIT $2  [["user_id", 1], ["LIMIT", 11]]
 => #<ActiveRecord::Associations::CollectionProxy [#<Tweet id: 1, content: "My first ever tweet!  Awesome!", date: "2017-07-15 00:00:00", user_id: 1>, #<Tweet id: 2, content: "My first ever tweet!  Yay!", date: "2017-07-15 00:00:00", user_id: 1>]> 

```

Play with activerecord some more and create a few more records.  When you are done exit from irb.

```
2.3.1 :010 > exit
➜  sinatra-app git:(master) ✗ 
```
