# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning category database...'
Category.destroy_all
categories = ['RnB', "Raï'n'B", "Crunk'n'b", "Urban"]
categories.each do |categories|
  Category.create!(name: categories)
end
puts "Ajout category"

puts 'Cleaning user & profile database...'
User.destroy_all
Profile.destroy_all

puts 'Creating users & profiles ...'
user1 = User.new(email: "jcc197959@hotmail.fr", password: "password")
profile1 = Profile.new(first_name: 'JC', 
last_name: 'Coevoet', 
address: '102 avenue de Bretagne', 
address_zipcode: 59_000, 
address_city: "Lille", 
address_country: "France")

user2 = User.new(email: "zpichetti@gmail.com", password: "password")
profile2 = Profile.new(first_name: 'Xavier',
last_name: 'Pichetti',
address: 'Près de la pizzeria',
address_zipcode: 59_000,
address_city: "Lille", 
address_country: "France")

user3 = User.new(email: "antoinepotdevin@gmail.com", password: "password")
profile3 = Profile.new(first_name: 'Antoine',
last_name: "Potdevin",
address: "A la clope",
address_zipcode: 59_000,
address_city: "Lille", 
address_country: "France")

profile1.user = user1
profile2.user = user2
profile3.user = user3

user1.save!
user2.save!
user3.save!

profile1.save!
profile2.save!
profile3.save!

puts 'Cleaning performance_date database...'
PerformanceDate.destroy_all
puts 'create 1 perf date'
PerformanceDate.create!()


puts 'Finished!'

