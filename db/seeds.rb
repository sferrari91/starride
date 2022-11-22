require 'faker'

user = User.create!(
  email: "potatos123456@gmail.com",
  password: "123456"
)

5.times do |i|
  spaceship = Spaceship.create!(
    name: Faker::TvShows::StarTrek.character,
    description: Faker::Movies::StarWars.quote,
    planet: "Earth",
    price_per_day: rand(50..10000),
    number_of_passenger: rand(2..300),
    user: user
  )
  puts "#{i + 1}. #{spaceship.name}"
end
