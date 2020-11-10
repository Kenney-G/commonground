## **What is the Many to many relationship and how is it used?**

Users <=> Topics, we have a view to display all of a user's topics and a view to display all users who have rated their topic via interest_level

/topic/:topic_id/users/

/user/:user_id/topics/

## **What is the User Submittable attribute on the join model?**

InterestLevel must have a user_interest_level

## **What Validations do we need?**

Users must have a username, password, interest, and user_interest_level

Topics must have a name and at least one user_interest_level

interest_level must have a user_id and interest_id

## **How do users fit into the application? How are they related to the other models?**

A user rates their interest in a Topic via user_interest_level, which then updates InterestLevel associating that user with that topic and vice versa
user has_many :interest_levels, has_many :topics, through: :interest_levels,
topic has_many :interest_levels, has_many :users, through: :interest_levels

## **What are our Nested Routes? (We need a nested new route and either a nested index or nested show route)**

/user/:user_id/topics => all of that user's rated topics
/topic/:topic_id/users => all users who have rated this topic (the one who is identified by `params[:topic_id]`)/user/:user_id/topics/new => a new topic form for the current user which will first check to see if the topic already exists. If it does, it will add it to the user_id's topics via interest_level and if it does not it will first create the topic before performing the afformentioned action.

## **Do we have Non Nested Versions of those nested routes?**

/topics => A list of all topics that have been created by users
/topics/new =>  redirects to either user/:user_id/topics/new if current_user?, or directs to login/signup page

## **What Scope Method(s) do we have and how are they used? (class methods that return an ActiveRecord::Relation)**

Appointment.past => appointments that have ended already.Appointment.upcoming => appointments that haven't started yet.in your appointments#index action, you could accept a query parameter for time and check whether it says "past" or "upcoming" and add that scope to the results as appropriate./appointments?time=past => We'll have the .past scope method added to our results/appointments?time=upcoming => We'll have the .upcoming scope method added to our results

## **What does the schema for our app look like?**

```ruby
# table migration for: users
# t.string :username
# t.string :password_digest
class CreateUser < ActiveRecord::Migration[5.2]
	def change
		create_table :User do |t|
			t.string :username
			t.string :password_digest
	end
end

class User

 # relationships
	has_many interest_levels
	has_many topics, through: :interest_levels
# validations
 :username, presence: true, uniqueness: true
 :password, presence: true

# scope_methods (if any)

end

# table migration for: topics
# t.string :name
# t.references :user
class Topic
 # relationships
 has_many :interest_levels
 has_many :users, through: :interest_levels
	# validations
 validates :name, presence: true

end


# table migration for: interest_levels
# t.references :topic
# t.references :user

class InterestLevel
 # relationships
 belongs_to :topic
 belongs_to :user
	# validations
 validates :topic_id, :user_id,  presence: true
	# user submittable attributes (if this is a join model)
	 #user_interest_level
# scope_methods (if any)
 # InterestLevel.topic_average => shows total average of all users' interst_level ratings for an interest.
 # InterestLevel.most_recent => shows a list of the last topics that have been given an interest_level by users.
end

- [x]  Using Ruby on Rails for the project
- [x]  Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
    - [ ]  User has_many :topics, through: interest_levels
- [x]  Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    - [ ]  :interest_level belongs_to :interest
    - [ ]  :interest_level belongs_to :user
- [x]  Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    - [ ]  User has_many :topics, through: interest_levels
    - [ ]  Topic has_many :users, through: interest_levels
- [x ]  Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    - [ ]  User has_many :topics, through: interest_levels
    - [ ]  Topic has_many :users, through: interest_levels
- [x ]  The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
    - [ ]  users' rating of interest in a topic - user_interest_level
- [ x]  Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    - [User must have username, password ]
    - [Topic must have name] 
    -[InterestLevel must have user_id, interest_id, user_interest_level] 
- [ x]  Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    - [ ]  
- [ ]  Include signup
    - [ ]  
- [ ]  Include login
    - [ ]  
- [ ]  Include logout
    - [ ]  
- [ ]  Include third party signup/login (how e.g. Devise/OmniAuth)
    - [ ]  
- [ ]  Include nested resource show or index (URL e.g. users/2/recipes)
    - [ ]  
- [ ]  Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
    - [ ]  
- [ ]  Include form display of validation errors (form URL e.g. /recipes/new)
    - [ ]  

Confirm:

- [ ]  The application is pretty DRY
- [ ]  Limited logic in controllers
- [ ]  Views use helper methods if appropriate
- [ ]  Views use partials if appropriate

1. Your models must:

    > • Include at least one has_many, at least one belongs_to, and at least two has_many :through relationships• Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user

2. Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.
3. You must include at least one class level ActiveRecord [scope method](https://guides.rubyonrails.org/active_record_querying.html#scopes). a. Your scope method must be chainable, meaning that you must use [ActiveRecord Query methods](https://guides.rubyonrails.org/active_record_querying.html) within it (such as `.where` and `.order`) rather than native ruby methods (such as `#find_all` or `#sort`).
4. Your application must provide standard user authentication, including signup, login, logout, and passwords.
5. Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...
6. You must include and make use of a nested resource with the appropriate RESTful URLs.

    > • You must include a nested new route with form that relates to the parent resource• You must include a nested index or show route

7. Your forms should correctly display validation errors.

    > a. Your fields should be enclosed within a fields_with_errors classb. Error messages describing the validation failures must be present within the view.

8. Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app.

    > • Logic present in your controllers should be encapsulated as methods in your models.• Your views should use helper methods and partials when appropriate.• Follow patterns in the Rails Style Guide and the Ruby Style Guide.

9. **Do not** use scaffolding to build your project. Your goal here is to learn. Scaffold is a way to get up and running quickly, but learning a lot is not one of the benefits of scaffolding.
10. Your models must:

    > • Include at least one has_many, at least one belongs_to, and at least two has_many :through relationships• Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user

11. Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.
12. You must include at least one class level ActiveRecord [scope method](https://guides.rubyonrails.org/active_record_querying.html#scopes). a. Your scope method must be chainable, meaning that you must use [ActiveRecord Query methods](https://guides.rubyonrails.org/active_record_querying.html) within it (such as `.where` and `.order`) rather than native ruby methods (such as `#find_all` or `#sort`).
13. Your application must provide standard user authentication, including signup, login, logout, and passwords.
14. Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...
15. You must include and make use of a nested resource with the appropriate RESTful URLs.

    > • You must include a nested new route with form that relates to the parent resource• You must include a nested index or show route

16. Your forms should correctly display validation errors.

    > a. Your fields should be enclosed within a fields_with_errors classb. Error messages describing the validation failures must be present within the view.

17. Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app.

    > • Logic present in your controllers should be encapsulated as methods in your models.• Your views should use helper methods and partials when appropriate.• Follow patterns in the Rails Style Guide and the Ruby Style Guide.

18. **Do not** use scaffolding to build your project. Your goal here is to learn. Scaffold is a way to get up and running quickly, but learning a lot is not one of the benefits of scaffolding.