# README

How to use this app:

Requirements
* Ruby version >= 2.6.6
* Rails >= 2.5.5

* Configuration
run `rails server` from terminal and visit localhost:3000 in your browser

* Database creation
run `rails db:migrate` from terminal which will automatically create and initialize a database if one does not exist.
run `rails db:rollback` to undo changes or `rails db:drop`to destroy the database and start over.

* Deployment instructions
remove sqlite3 gem from Gemfile and replace with postgresql
create a repository on github
add . commit -m this app from your local terminal
create a new app on heroku and link to your github repository
deploy
* ...
