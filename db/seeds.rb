# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Create users
20.times do
  User.create!(
  email:     Faker::Internet.unique.safe_email,
  password:  Faker::Internet.password(10, 20)
  )
end
users = User.all

# Create wikis
25.times do
  Wiki.create!(
  title:     Faker::Hipster.unique.word,
  body:      Faker::Hipster.paragraph,
  user:      users.sample
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
