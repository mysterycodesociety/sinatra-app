## Add validations

Let's add some validations so that we can't accidentally save bad data.

Tweet validations:
1. A tweet must have a user.
1. A tweet must have content.
1. A tweet must have a date.


User validations:
1. A user must have a name.
1. A user must have a salutation.
1. A user must have an email.
1. Email must be unique.


We have two places to add validations - the database (using a database migration) and the model (in ruby).  For now, let's Let's add these validations to the model.

Open up the `models/tweet.rb` file, and let's add our validations.

```
class Tweet < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :content, presence: true
  validates :date, presence: true
end

```

Save the change.  Since we added it to the ruby file, we expect this to fail when we are running ruby code, so let's use irb to run some ruby.

Run irb and require the file.  Try to create a brand new Tweet and save it before you set any of the parameters.
```
➜  sinatra-app git:(master) ✗ irb
2.3.1 :001 > require './app.rb'
 => true 
2.3.1 :002 > a = Tweet.new
 => #<Tweet id: nil, content: nil, date: nil, user_id: nil> 
2.3.1 :003 > a.save
D, [2017-07-15T06:25:24.267427 #49488] DEBUG -- :    (0.2ms)  BEGIN
D, [2017-07-15T06:25:24.286238 #49488] DEBUG -- :    (0.4ms)  ROLLBACK
 => false 
```
Notice that it ends in `false` here.  Meaning the save did not happen.  If you look at the SQL above, it rolled back, meaning it tried to execute and then undid it.

So it failed.  If you were trying to figure out why, how could you tell?

ActiveRecord adds an ActiveModel::Errors object that stores an array of error messages when it validates.  So if you type `a.errors`, you will get the errors for the file you just saved.

```
2.3.1 :004 > a.errors
 => #<ActiveModel::Errors:0x007fe70fc0a528 @base=#<Tweet id: nil, content: nil, date: nil, user_id: nil>, @messages={:user=>["can't be blank"], :content=>["can't be blank"], :date=>["can't be blank"]}, @details={:user=>[{:error=>:blank}], :content=>[{:error=>:blank}], :date=>[{:error=>:blank}]}> 
2.3.1 :005 > 
```

a. User can't be blank.
b. Content can't be blank.
c. Date can't be blank.

Cool!  Thanks, ActiveRecord!  That's really awesome.

What about a record that has all it needs.  Will it have errors?  Try it and check it out.

## Next Steps:

1. Add the valdiations to the User class model. If you need help, google it or look it up in [ActiveRecord's documentation](http://guides.rubyonrails.org/active_record_validations.html).
1. Verify your validations work using irb.