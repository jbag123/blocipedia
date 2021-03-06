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
  email: Faker::Internet.unique.safe_email,
  password: Faker::Internet.password(10, 20)
)
end

premium_user = User.create!(
  email: 'premium@example.com',
  password: 'password',
  role: 'premium',
)

(1..10).to_a.each do |num|
  Wiki.create!(
    title: "This is the title for #{num}",
    body:   %Q{> This is body text for my wiki! },
    user: premium_user,
    private: true,
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
