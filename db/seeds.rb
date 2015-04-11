require 'faker'

u1 = User.create(name:"u1", password: "u1")
u2 = User.create(name:"u2", password: "u2")
u3 = User.create(name:"u3", password: "u3")
u4 = User.create(name:"u4", password: "u4")

5.times do
	Recipe.create(name: Faker::Hacker.noun, ingredients: Faker::Lorem.words(5).join(" "), instructions: Faker::Hacker.say_something_smart, user_id: 1, photo_url: "http://colettefreedman.com/wp-content/uploads/2014/11/grilled-cheese-closeup.jpg")
end

5.times do
	Recipe.create(name: Faker::Hacker.noun, ingredients: Faker::Lorem.words(5).join(" "), instructions: Faker::Hacker.say_something_smart, user_id: 2)
end

5.times do
	Recipe.create(name: Faker::Hacker.noun, ingredients: Faker::Lorem.words(5).join(" "), instructions: Faker::Hacker.say_something_smart, user_id: 3)
end

5.times do
	Recipe.create(name: Faker::Hacker.noun, ingredients: Faker::Lorem.words(5).join(" "), instructions: Faker::Hacker.say_something_smart, user_id: 4)
end