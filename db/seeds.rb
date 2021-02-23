# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

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

  15.times do
    new_lego = Lego.new(
        name: Faker::Game.title,
        price: [10, 15, 20, 25, 30, 35, 40, 45, 50].sample,
        pieces: [100, 150, 200, 250, 300, 350, 400, 450, 500].sample,
        description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      )
    new_lego.user = new_user
    new_lego.save!
  end
end
puts 'Finished!'