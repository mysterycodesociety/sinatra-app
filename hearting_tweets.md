## Many to Many Relationships

Twitter not only allows users to create tweets - it allows other users to heart tweets.

```
A tweet has many hearts.
A user has many hearts.
```

Both tweet and user have many hearts.  That is a many-to-many relationship.  What do you do when you have a many-to-many relationship?  Make a join table, and let's call it hearts.

```
A heart belongs to a user.
A heart belongs to a tweet.
```

1. Create a migration for a table called hearts.  It should have, a user_id, a tweet_id, and timestamps.
1. Run your migration.
1. Create a class called Heart that inherits from ActiveRecord::Base and add it to the models folder.
1. Add associations to the Heart class.
1. Add associations to the User and Tweet class, now that they have a relation to Heart.
1. Add validations to the Heart class.  A heart requires a tweet.  A heart requires a user.
1. Using irb, require the app.rb file and create some heart records.


## Adding views

We don't want to create a set of restful routes for hearts, because they don't make any sense outside of the context of a tweet.  But we would like to show them (or the number of hearts) on a tweet.


```
<!-- users/show.erb -->

<h2>Hi, <%= @user.salutation %></h2>
<h3>Your Tweets:</h3>
<ul>
<% @user.tweets.each do |tweet| %>
  <li><%= tweet.content %> at <%= tweet.date %> with <%= tweet.hearts.count %> hearts</li>
<% end %>
</ul>
```

We would also like to allow the user to heart something when they are looking at a tweet.  So add a form with an action that will post a heart.  Because we don't have authentication and logging in working yet, we will also use the form to capture the email address so we can find which user is hearting the tweet.


```
<!-- users/show.erb -->

<h2>Hi, <%= @user.salutation %></h2>
<h3>Your Tweets:</h3>
<ul>
<% @user.tweets.each do |tweet| %>
  <li>
    <%= tweet.content %> at <%= tweet.date %> with <%= tweet.hearts.count %> hearts
    <form method="POST" action="/heart">
      <p>Your Email: <input type="email" name="email" required=true></p>
      <input type="hidden" name="tweet_id" value="<%= tweet.id %>">
      <input type="submit" value="Heart">
    </form>
  </li>
<% end %>
</ul>
```

Now create a route that will handle that post request, look up the user by email and the tweet by its id, create a new heart record, and re-render the user's list of tweets, showing the new number of hearts it has.

## Handling a heart when a tweet is deleted

Right now, you can create a heart and you can delete a tweet or a user.  But what happens to the heart if you delete the tweet or user?  The heart makes no sense if the user or tweet is deleted.  So you want to delete it too if the user or tweet is deleted.

ActiveRecord has a way to handle dependencies like this, with a `dependent: destroy` attribute on its associations.  [Take a look at the associations](http://guides.rubyonrails.org/association_basics.html) documentation and add a dependency to hearts.  Check that it works using irb.

