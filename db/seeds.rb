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

5.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user = User.new({
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name}.#{last_name}@gmail.com",
    password: "password"
    })
  users << user
  user.save!
end

menus = []

users.each do |user|
  5.times do
    menu = Menu.new({
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.sentence,
      price: Faker::Number.between(2, 15),
      portions: Faker::Number.between(4, 8),
      availability: DateTime.now,
      user: user
      })
    menus << menu
    menu.save!
  end
end

simple_users = []

5.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user = User.new({
     first_name: first_name,
    last_name: last_name,
    email: "#{first_name}.#{last_name}@gmail.com",
    password: "password"
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
