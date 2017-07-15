## Handling Errors

We've seen already how ActiveRecord handles validations and prevents bad records from being saved.  It also lets you know what the errors were, by creating an Errors object with messages about the errors, when you call `.erorrs` on the object.

But what happens if the object failed to save when the user posted it back to the server?  How do we let the user know what happened?

It would be nice if we could: 1) let the user know the erorr occurred; 2) display the error message; 3) let the user try again (saving where they started).

## Errors on a new user

Currently, when a new user is created, our routes save the record and redirect to the show page.  Now we would like to alter the code so that we only redirect if it's true.  If it's false, we want to re-generate the form with the same model/data and display the errors.

The ActiveRecord commands `.save` and `.update` will return `true` if the record was saved successfully and will return `false` if the save was not successful.  That's useful as we determine if we should continue.  Let's change the logic in our routes to handle this scenario.  The condition we use can literally be the `.save` event.

```
get '/users/new' do
  
  @user = User.new
  erb :"users/new"

end


post '/users' do
  @user = User.new(params)
  
  if @user.save  # user.save returns a true if successful or false if not

    # if it saved, go to user's show page
    redirect "/users/#{@user.id}"
  
  else

    # else display the new page again
    erb :"users/new"
  
  end
end


```

Then in your `users/new.erb` file, add a display for the errors above your form so the user can see them.  

Notice that the value on the inputs are set to the `@user`'s attributes.  This will mean if the user submits wrong, they can see their old answers and the errors.  But if it's the first time, all the attributes and errors are nil.  

Yay!

```
<% @user.errors.full_messages.each do |error| %>
  <p style="color:red;"><%= error %></p>
<% %>

<form method="POST" action="/users">
  <input type="email" name="email" value="<%= @user.email %>">
  <input type="text" name="name" value="<%= @user.name %>">
  <input type="salutation" name="salutation" value="<%= @user.salutation %>">
  <input type="submit">
</form>

```


### Errors on Tweets and Hearts

Go back through your forms and add error messaging.