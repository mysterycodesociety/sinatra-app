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


You created the routes for '/users/' and '/users/:id'.  See if you can complete a set of restful routes for users.

FYI:

To create a set of fully restful routes, you will need to create forms.  HTML forms are how you send back data to the server for post and put/patch requests, without putting it in the url of the request.  

(Think about what would happen if you put a person's password in the url when you were logging in or changing the password.  It would be very insecure!)

[This guide](https://learn.co/lessons/sinatra-forms-params-readme-walkthrough) will walk you through how to use forms in Sinatra.

## Nested routes for tweets

Now let's create a second set of restful routes for tweets.  But because tweets belong to a user, the routes can be nested inside the route for a user, so you know who the tweet belongs to.

Nested routes look similar to restful routes, but they are nested inside the routes of another model.

|  **URL**            | **HTTP Verb** |  **Action**  |  **Meaning for a User** |
|---------------------|-------------|------------|------------|
| /users/:user_id/tweets/         | GET       | index  | I am seeing all the user's tweets |
| /users/:user_id/tweets/new         | GET       | new   | I am on the page to make a new tweet (but I haven't made one yet) |
| /users/:user_id/tweets          | POST      | create   | I am submitting my new tweet to the server (I hit submit) |
| /users/:user_id/tweets/:id      | GET       | show      | I am seeing a single tweet |
| /users/:user_id/tweets/:id/edit | GET       | edit      | I am on the page to edit an existing tweet (but haven't changed it yet) |
| /users/:user_id/tweets/:id      | PATCH/PUT | update    | I am submitting a changed tweet back to the server (I hit submit) |
| /users/:user_id/tweets/:id      | DELETE    | destroy  | I am deleting a single tweet |

Make nested routes for tweets.  Since we have nothing else on the user's page, you can leave out the index page for tweets and continue to show them on the user's landing page, if you like.

In that case, it would be a completedly nested route EXCEPT for index.
