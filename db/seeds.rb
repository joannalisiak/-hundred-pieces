# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

puts "Cleanign database..."
Lego.destroy_all

puts 'Creating 5 fake users...'
5.times do
    new_user = User.new(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        password: "123456",
        avatar_url: Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg"),
        email: Faker::Internet.email
      )
  new_user.save!

  5.times do
    new_lego = Lego.new(
        name: Faker::Game.title,
        price: (1..20).to_a.sample,
        pieces: [100, 150, 200, 250, 300, 350, 400, 450, 500, 550, 600, 650, 700, 750, 800, 850, 900, 950, 1000].sample,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
      )
    new_lego.user = new_user
    new_lego.save!
  end
end
puts 'Finished!'