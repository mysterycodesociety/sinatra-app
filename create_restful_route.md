## Creating Restful Routes


We will get into Restful Routes next class.  But you're pretty far!  

Restful Routes is a pattern to creating routes that allows you to do the four major database actions (CRUD):
- Create
- Read
- Update
- Destroy

These are standards.  Not every website or application follows these conventiosn, but following them is a good idea.  It means new developers know what they are doing.

We have been using `get` http verbs so far, but there are actually some more verbs - put/patch, which means you are updating.  Post means you are creating.  And delete.

These are the restful routess.


| **URL** | **HTTP Verb** |  **Action**  |  **Meaning for a User** |
|------------|-------------|------------|------------|
| /photos/         | GET       | index  | I am seeing all the photos ||
| /photos/new         | GET       | new   | I am on the page to make a new photo (but I haven't made one yet) |
| /photos          | POST      | create   | I am submitting my new photo to the server (I hit submit) |
| /photos/:id      | GET       | show      | I am seeing a single photo |
| /photos/:id/edit | GET       | edit      | I am on the page to edit an existing photo (but haven't changed it yet) |
| /photos/:id      | PATCH/PUT | update    | I am submitting a changed photo back to the server (I hit submit) |
| /photos/:id      | DELETE    | destroy  | I am deleting a single photo |


You created the routes for '/users/'' and '/users/:id'.  See if you can complete a set of restful routes for users.

If you finish that, create a set of restful routes for tweets.

FYI:

To create a set of fully restful routes, you will need to create forms.  HTML forms are how you send back data to the server for post and put/patch requests, without putting it in the url of the request.  

(Think about what would happen if you put a person's password in the url when you were logging in or changing the password.  It would be very insecure!)

[This guide](https://learn.co/lessons/sinatra-forms-params-readme-walkthrough) will walk you through how to use forms in Sinatra.