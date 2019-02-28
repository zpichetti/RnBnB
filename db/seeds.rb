# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.destroy_all
Performance.destroy_all

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
address: '7 avenue Hippolite Peslin',
address_zipcode: 59_000,
address_city: "Lille", 
address_country: "France")

user3 = User.new(email: "antoinepotdevin@gmail.com", password: "password")
profile3 = Profile.new(first_name: 'Antoine',
last_name: "Potdevin",
address: "25 avenue de Flandre",
address_zipcode: 75_018,
address_city: "Paris", 
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

puts "create perf & booking"

perf = Performance.new(title: "Best performer of the year", description: "Tout l'univers RnB se l'arrache, c'est un dinguo un peu foufou, il s'appelle Nicolas", image_url: "test pour le moment", hour_price: 15)
perf.category = Category.find_by_name('RnB')
perf.profile = profile1
perf.save!

book1 = Booking.new(status: "on demand", start: "2019-02-25".to_date, end: "2019-02-27".to_date)
book2 = Booking.new(status: "performed", start: "2019-03-15".to_date, end: "2019-03-18".to_date)
book3 = Booking.new(status: "waiting for payment", start: "2019-03-18".to_date, end: "2019-03-22".to_date)
book1.profile = profile1
book2.profile = profile1
book3.profile = profile1
book1.performance = perf
book2.performance = perf
book3.performance = perf
book1.save!
book2.save!
book3.save!

puts 'Finished!'

