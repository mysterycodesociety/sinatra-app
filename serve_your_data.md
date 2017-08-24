## Sinatra Server

So far, we've been doing activerecord stuff to set up your database.  Let's serve it up over html pages!  That's where Sinatra will come in.

Sinatra handles all the http requests, and it knows how to send the correct html response.  It knows how to do that, and you don't need to understand everything about how it works.

But you do need to understand the parts of an http request.  `nytimes.com` has a domain `nytimes` and top level domain `.com`.  But you've probably also seen links to specific articles:

[https://open.blogs.nytimes.com/2016/08/04/girls-who-code-visit-the-new-york-times/](https://open.blogs.nytimes.com/2016/08/04/girls-who-code-visit-the-new-york-times/)

`open.blogs.nytimes.com` is the domain, which tells the servers along the way  -  Send me to the New York Times server!  The New York Time's servers had to handle the rest of the request: `/2016/08/04/girls-who-code-visit-the-new-york-times/`.  That's how you get the specific article when you visit that url.

That's the part you are going to write today - you are going to write the code on the server that determines how the `/users` request is different than `/users/1` request.

These different requests are called `routes`, and it's what we will write today.

Let's start with the classic: hello world.

1. Open the routes.rb file and type the following in. Save it.

```
get '/hello' do
  'Hello world!'
end
```

This is telling Sinatra that if it gets the request '/hello' with the verb 'get' (which is the default verb in http), return the string 'Hello World!'. 

Let's see it in action.

1. Run a sinatra server.
In terminal, type in the following command and notice the output.  Follow the link provided by Cloud 9 to get to your domain.

```
 $ rake serve
 =>
 == Sinatra (v2.0.0) has taken the stage on 4567 for development with backup from Puma
Puma starting in single mode...
* Version 3.6.2 (ruby 2.3.1-p112), codename: Sleepy Sunday Serenity
* Min threads: 0, max threads: 16
* Environment: development
* Listening on tcp://localhost:4567
Use Ctrl-C to stop
```

Now add `/hello` to the end of the url.

You should have an empty web page that says "Hello world!"

Quit your Sinatra server by typing `Command + C` or `Control C` into terminal.

## Serving up our data

Let's do something a little more exciting.  Let's serve up some of the data from our database.

1. Define a route for '/users' which will list all our users.
1. Define a route for a specific user, which will say, "Hello" and then the user's name.


First, let's define a route for '/users', and we want it to fetch all of our User names and display them. We should be able to use the same ruby commands as we did in irb inside our methods.  


a. Get all users.  In ActiveRecord, to get all records from a database, you use the `.all` command.   So `@users = User.all` will get you all users and name them @users.

b. Get all user names.  Let's get salutations from each user.  We will need to loop through each user and push its salutation into an array.

c. Convert the array into a string.  Find a method that will convert the contents of an array in ruby into a string.

If we follow those steps, we get the following code.


```
# routes.rb
get '/hello' do
  'Hello world!'
end

get '/users' do
  @users = User.all
  names = []
  @users.each do |user|
    names << user.salutation
  end
  "Here are all the users: #{names.join(' ')}"
end
```

Try running your Sinatra server and going to the '/users' route.  You should see a list of all your users.


## Defining a route for an individual user

Let's say we want a landing page for each user though.  It's the page for their account.

First, let's define that route.


This route would define the route for a single user with an id of 1.  But although we know how many records we have now, we don't know how many we will get in the future.

So how do we do this?

```
# routes.rb - continued


get '/users/1' do
end
```


We do this like we would if we were coding - defining a variable for the individual user's id.  In the code below, we are telling Sinatra, 'expect a route to start with /users/' and then something comes after it.  I want to be able find what comes after it using a variable called `:id`.

```

# routes.rb - continued

get '/users/:id' do
end

```

Let's use a tool called `pry` that will allow us to stop code in the middle of executing so that we can play with ruby and inspect it.  It's something we would never use in production, but we can use it while we're developing.  Add a `binding.pry` line fo code inside that route.

```
# routes.rb - continued

get '/users/:id' do
  binding.pry
end
```

Now stop your server and restart it.  Go to '/users/1'.  Your browser should load and load and load.  But if you look in terminal, you can see it's just stopped.

```
From: /Users/gwendolyn1/Code/sinatra-app/routes.rb @ line 14 self.GET /users/:id:

     9:   'Hello world - this is the users pages'
    10: end
    11: 
    12: get '/users/:id' do
    13:   binding.pry
 => 14: end 
    15:
    16:
    17: 

[1] pry(#<Sinatra::Application>)>

```

Try typing `params` into terminal and hitting enter to see what it is.  It returns a Ruby hash.  The hash has a key called `captures` which contains an empty array.   And it has a key called `id` which is "1".

Params is where all the variables that are sent back by the request are stored.  Cool!  We know how to capture the id.
```
[1] pry(#<Sinatra::Application>)> params
=> {"captures"=>[], "id"=>"1"}
```

Type `exit` to exit out of pry.  Quit your server.  Now let's try changing our route to use params[:id].  Save the change and restart the server.

```
# routes.rb - continued

get '/users/:id' do
  id = params[:id]
  @user = User.find(id)
  "Hello, #{@user.salutation}"
end
```

Now it should work!

