## Create layouts


It's cool that we can send back the data we want, but ideally, we want it in something other than a string.

Sinatra supports views, which allow you to write a combination of ruby and html so that you can style and serve up more complicated information.  The file types for a combination of html/ruby is `erb`

In an `erb` file, the ruby code goes in erb tags that look like this `<% %>`.  That tells the compiler, "Hey, run this as ruby, ok?" before compiling.  Everything outside of the tags is rendered as html.

If you want it to run ruby, use empty erb tags.

If you want it to display the contents after running, add an '=' to the tags, like this: `<%= %>`.

## Let's make our first layout

1. Create a folder in the `views` folder for users and call it `users`.
1. Create a file for showing all the users inside that folder, and call it `index.erb`.


In our `index.erb` file, we are going to use html to display our users in a better way than we did before.

```
<h2>Users</h2>
<ul>
<% @users.each do |user| %>
  <li>Hi, <%= user.salutation %>!</li>
<% end %>
</ul>

```

Our loop can be right on the page.  So we use the html tags for an unorderd list `ul` and display each name as a list item `li` tag.  We have access to `@users` from our `routes.rb` file because we put the `@` sign in front of it.  If it was missing that `@` sign, it would not be available in our `erb` file.

Now let's change our route so that it serves up this index page instead of a string.

```
get '/users' do
  @users = User.all
  erb :"users/index"
end
```

Sinatra returns the last line of our method.  So we say, "Please return an erb file.  You can find it in the views folder, and it will be called users/index.erb".

Quit and restart your server and go to your users page.  You should find it nicely styled for you!


## Create a single user page

Now let's make a layout for a single user.

1. Create a file inside the users folder and call it `show.erb`.
1. Create a `h2` tag and inside it say, "Hello", and the user's name.
1. Use an unordered list `ul` tag and loop through the user's tweett to display them.


## Link from the user's page back to the single user page.

Now that we've got the users index page and the user show page, let's link to the user's page from the index page.

Go back to the `index.erb` users file, and let's use html to link to the user's page.  We know what the path to a user's page is: `/users/:id`.   So we should be able to build it.  

We are going to use the html `a` link tag to create links.  `href` on a link is the attribute used to tell the browser the address of the link, and the browser takes care of sending a new request when the button is clicked.

```
<h2>Users</h2>
<ul>
<% @users.each do |user| %>
  <li><a href="/users/<%= user.id %>">Hi, <%= user.salutation %>!</a></li>
<% end %>
</ul>
```

## Stretches

1. Add a link from the user show page back to the users index page.
