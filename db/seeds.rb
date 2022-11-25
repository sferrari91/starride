require 'faker'
Booking.destroy_all

Spaceship.destroy_all
User.destroy_all


user = User.create!(
  email: "potatos12345678@gmail.com",
  password: "1234567"
)

5.times do |i|
  spaceship = Spaceship.create!(
    name: Faker::TvShows::StarTrek.character,
    description: Faker::Movies::StarWars.quote,
    planet: "Earth",
    price_per_day: rand(50..10000),
    number_of_passenger: rand(2..300),
    user: User.last,
  )
  puts "#{i + 1}. #{spaceship.name}"
end
