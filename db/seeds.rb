# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "cleaning database"
Restaurant.destroy_all

puts "creating restaurants"

20.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample,
    phone_number: Faker::PhoneNumber.phone_number,
  )
  puts "restaurant with id: #{restaurant.id} has been created"
end

puts "finished"

puts "cleaning database"
Review.destroy_all

puts "creating reviews"

100.times do
  review = Review.create(
    content: Faker::Quote.fortune_cookie,
    rating: rand(0..5),
    restaurant_id: Restaurant.all.sample.id,
  )
  puts "review with id: #{review.id} has been created"
end

puts "finished"
