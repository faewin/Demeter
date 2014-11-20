10.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "password")
end

25.times do
  Twit.create(message: Faker::Hacker.say_something_smart, user_id: rand(1..10))
end
