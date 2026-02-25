# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

Restaurant.destroy_all
Review.destroy_all
puts "Clean restaurants & reviews"


puts "Creating restaurants & reviews"

10.times do
  Restaurant.create!(name: Faker::Restaurant.name, address: Faker::Address.full_address, category: Restaurant::CATEGORIES.sample, phone_number: Faker::PhoneNumber.phone_number_with_country_code)
end
puts "#{Restaurant.count} restaurants created."
@restaurants_id = Restaurant.all.map { |restaurant| restaurant.id }

10.times do
  Review.create!(content: Faker::Restaurant.review, rating: rand(0..5), restaurant_id: @restaurants_id.sample)
end
puts "#{Review.count} reviews created."
