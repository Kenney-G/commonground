# README

## Flatiron School Project 3 - Rails, Omniauth | Not deployment ready

Commonground is a web application for users to find other users who share their interests by rating their own interest in their favorite topics.

* Ruby:
    -Bundled with version 2.7.2
    -Requires at least version 2.6.6

* System dependencies
 - ruby dependencies
 - rails 6 gem
 - sqlite3
 - nodejs
 - npm
 - yarn
   Dependencies for these will vary based on your OS and package manager.

### Setting up

<br> 
* In your terminal:
<br> 
    - git clone https://www.github.com/kenney-g/commonground.git
    - cd commonground
    - bundle install
    - yarn add bootstrap jquery popper.js
    - yarn add bootswatch
    - yarn upgrade
    - rails db:migrate
    - rails s
    - ctrl/cmd + c to stop the local server
    <br> 
* In your web browser:
<br> 
    - localhost:3000
    <br> 
<br> 
    rails db:migrate will handle the initial database set-up
<br> 
### Use
<br> 
From the home page you can sign up and rate your interest in your first topic. Either username or email is accepted as well as login via github. To use the github sign-in, you'll need to head to [github's developer portal](https://github.com/settings/developers) and make a new oauth app. Enter http://localhost:3000/ for the homepage url and http://localhost:3000/users/auth/github/callback for the callback url. In your terminal or file explorer head to commonground/app/config/initializers/devise.rb and replace the two areas in quotes next to config.omniauth :github, "APP_ID", "APP_SECRET" with the secret and client ID given to you after creating your app.
<br>
Users may edit their own list of topics by adding, deleting, or editing them from their profile once they've logged in. In order to add a topic, a user must rate their level of interest and a topic must have at least one user to exist. They may also adjust their level of interest in topics they've already rated. Users cannot edit another user's topic or interest level. A topic may also not be edited or deleted once created. (In production this feature would be handled via an admin role along with approving submitted topics, while users could report inappropriate or erroneous topics). Supplementary information to topics such as the description or referential links can, however, be added or edited by all. (To prevent vandalization this would also require moderation or peer review in production). Users have the option to comment on their interest level in a topic which has the by-effect of acting as a sort of forum for people who have the same level of interest in a given topic.
