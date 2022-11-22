# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

user = User.create!(
  email: "potatos1234@gmail.com",
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
