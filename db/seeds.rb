require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
    User.create(username: Faker::Internet.user_name, email: Faker::Internet.safe_email, encrypted_password: Faker::Internet.password(6, 20, true, true))
end

Topic.create(name: "Art and culture", description: "Express yourself." )
Topic.create(name: "Geography and places", description: "'round the World" )
Topic.create(name: "Health and fitness", description: "An apple a day." )
Topic.create(name: "History and events", description: "Those who know not their history..." )
Topic.create(name: "Mathematics and abstractions", description: "Algrabraic! " )
Topic.create(name: "Natural sciences and nature", description: "Everything below and above the stars" )
Topic.create(name: "People and self", description: "Hobbies, Visual Arts, Performance Arts etc." )
Topic.create(name: "Philosophy and thinking", description: "We think, but are we?" )
Topic.create(name: "Religion and spirituality", description: "Higher power." )
Topic.create(name: "Social sciences and society", description: "Economics, politics, psychology, education and much much more" )
Topic.create(name: "Technology and applied sciences", description: "Engineering, computer science, robotics etc." )
  
end