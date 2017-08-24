# Sinatra

Up to this point, we have been working with a database that exists only on your computer.  Active Record helped us quickly set the database up and interact with it using ruby instead of SQL.

But ideally, we want end users to be able to query the database and (maybe, if they have permission) create, update, and delete records.

We could handle that distribution/access problem in a few ways, but in this case, we will be setting up a web server that will allow users to access the database using http requests.  Our end users will request a web page, like: 'somedomain.com/users', and our server will return a web page which lists the users in our database.

For now, this server will be a local server that can only be accessed in our Cloud 9 workspace, because we are still in development.  Instead of having a domain like `google.com`, we will have a local domain: `localhost`, and we will specify the port number.  We will be using a very light ruby web freamwork called Sinatra, and Sinatra uses port 4567, so a full domain might look like: `localhost:4567/users`.

We will learn more about http requests, servers, and how the internet works next week.

Today, let's spin up Sinatra and see what it does.

Follow the steps below to set up your environment.

1. Log into GitHub and fork this repo to your own account.
1. Click the clone or download link and copy the ssh clone name.  (Toggle between https and ssh until you see Clone with ssh indicator.)
1. Log into Cloud 9.
1. In the root of your Cloud 9 workspace, open a terminal window and type `git clone ` and then paste the name of the repo you copied.  It might look like `git clone git@github.com:Gmfholley/sinatra-app.git`.
1. Change your directory into the folder you just made: `cd sinatra-app`.
1. `bundle install` to install all the files for this repo.
1. Start postgres services.  NOTE: You will need to do this every day.
```
 $ sudo service postgresql start
```

Now that you're reay to get started.


1. [Set up Cloud 9](./set_up.md) (If you have done this already for active record, you can skip.)
1. [Set up Models](./set_up_models.md)
1. [Add validations](./add_validations.md)
1. [Run server](./serve_your_data.md)
1. [Create layouts](./create_layouts.md)
1. [Set up a restful route](./create_restful_route.md)
1. [Add hearts to tweets](./hearting_tweets.md)
1. [Handle errors](./handling_errors.md)