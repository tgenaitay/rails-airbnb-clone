# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
require 'faker'
require 'date'
Order.destroy_all
Menu.destroy_all
User.destroy_all
users = []

5.times do |i|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user = User.new({
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name}.#{last_name}@gmail.com",
    password: "password",
    photo_url:  "https://randomuser.me/api/portraits/men/#{i}.jpg",
    description: Faker::Lorem.sentence(25),
    address: Faker::Address.city
    })
  users << user
  user.save!
end

menus = []

photo_index = 1
users.each do |user|
  2.times do
    menu = Menu.new({
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.sentence,
      price: Faker::Number.between(2, 15),
      portions: Faker::Number.between(4, 8),
      availability: DateTime.now,
      user: user,
      photo_url: "http://photos-famille.net/wagon/img#{photo_index}.jpg"
      })
    menus << menu
    menu.save!
    photo_index += 1
    photo_index = 1 if photo_index == 4
  end
end

simple_users = []

5.times do |i|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user = User.new({
     first_name: first_name,
    last_name: last_name,
    email: "#{first_name}.#{last_name}@gmail.com",
    password: "password",
    photo_url:  "https://randomuser.me/api/portraits/men/#{i+70}.jpg",
    description: Faker::Lorem.sentence(25),
    address: Faker::Address.city
    })
  simple_users << user
  user.save!
end

orders = []
user_index = 0
menus.each do |menu|
  2.times do |i|
    order = Order.new({
     date: DateTime.now,
     portions: i * 4,
     approved: i.odd?,
     menu: menu,
     user: simple_users[user_index]
      })
    user_index += 1
    user_index = 0 if user_index == simple_users.length
    orders << order
    order.save!
  end
end














   # movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
