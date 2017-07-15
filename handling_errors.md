## Handling Errors

We've seen already how active record handles validations and creates an Errors object with messages about the errors.

If the user tried to post back data that had an error on it, a good user experience would be to re-generate the form and display the error, so that the user can try again.

Currently, our routes save the data and redirect.  Now we only want to redirect if it's true.  If it's false, we want to re-generate the form with the same model and display the errors.

### Errors on the user model

`@user.save`, @ and `@user.update(params)` will return `true` if it saved successfully and will return `false` if the save was not successful.

```
get '/users/new' do
  
  @user = User.new
  erb :"users/new"

end


post '/users' do
  @user = User.new(params)
  
  if @user.save

    # if it saved, go to user's show page
    redirect "/users/#{@user.id}"
  
  else

    # else display the new page again
    erb :"users/new"
  
  end
end


```

Then in your `users/new.erb` file, add a display for the errors above your form so the user can see them.  Make sure the default values of your inputs are set to the `@user`'s attributes.  This will mean if they submit wrong, they can see their old answers and the errors.  But if it's the first time, all the attributes and errors are nil.  

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