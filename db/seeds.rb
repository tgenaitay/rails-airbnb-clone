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


p = "password"

users_attributes = [
  {
    first_name: "Michel",
    last_name: "Ducasse",
    email: "michel@ducasse.com",
    password: p,
    photo_url: "http://photos-famille.net/wagon/men/1.jpg",
    description: "Je cuisine occasionnellement pour moi et mes amis. Mes plats favoris viennent du Sud-Ouest mais je sais aussi cuisiner lèger. Ma grand-mère tenait un restaurant à Albi et j'y ai passé une grande partie de mon enfance. Ce sont les souvenirs de ses moments perdus que j'aime faire découvrir dans mes plats !",
    address: "18 rue des mauvestis, 13002 Marseille"
  },
  {
    first_name: "Monique",
    last_name: "Robuchon",
    email: "monique.rubuchon@yahoo.fr",
    password: p,
    photo_url: "http://photos-famille.net/wagon/women/1.jpg",
    description: "Je suis maman de 3 enfants alors la cuisine, vé, ça me connait pardi !. Je cuisine simple et frais. Mes plats sont de véritables bijoux. Vous me trouvez prétentieuse ? Alors passez commande et vous verrez. Régalez-vous bien !",
    address: "24 boulevard des dames, 13002 Marseille"
  },
  {
    first_name: "Philippe",
    last_name: "Bocuse",
    email: "phil_bogossedu13@gmail.com",
    password: p,
    photo_url: "http://photos-famille.net/wagon/men/2.jpg",
    description: "Moi je perds pas mon temps à chercher des saveurs ou à inventer des machins bof bof. Je fais un seul plat, mais je le fais bien. Ma daube de boeuf, elle va vous faire oublier celle de votre mère !",
    address: "12 rue de la république, 13002 Marseille"
  },
  {
    first_name: "Marcel",
    last_name: "Lignac",
    email: "marco_lignac@gmail.com",
    password: p,
    photo_url: "http://photos-famille.net/wagon/men/3.jpg",
    description: "J'adore prendre mon temps pour faire les marchés provencaux. Les produits frais du terroir, il n'y a que ça de vrai. Mon légumes de prédilection, c'est le poireaux. A toutes les sauces, dans tous les plats, il est partout. Bon, je ne suis pas bègueule non plus et j'aime aussi les courges et autres cucurbitacèes. Qu'on se le dise !",
    address: "12 rue plumier 13002, Marseille"
  },
  {
    first_name: "Marjorie",
    last_name: "Savoy",
    email: "marjo.savoy@gmail.com",
    password: p,
    photo_url: "http://photos-famille.net/wagon/women/2.jpg",
    description: "Moi je perds pas mon temps à chercher des saveurs ou à inventer des machins bof bof. Je fais un seul plat, mais je le fais bien. Ma daube de boeuf, elle va vous faire oublier celle de votre mère !",
    address: "60 la canebière, 13001 Marseille"
  },
  {
    first_name: "William",
    last_name: "Ripert",
    email: "willi.riri.loulou@gmail.com",
    password: p,
    photo_url: "http://photos-famille.net/wagon/men/4.jpg",
    description: "Moi, ma passion c'est le poisson. La rascasse, le merlu, le muge, la sardine, la girelle ou le sar, je les aime tous. Crus ou cuits, je vais vous faire voyager mes ailleuls ! Embarquez, (mais sans le Capitain Igloo) et suivez moi ! ",
    address: "26 rue d'Aix, 13002 Marseille"
  },
   {
    first_name: "Cédric",
    last_name: "Loiseau",
    email: "cedric.loiseau@gmail.com",
    password: p,
    photo_url: "http://photos-famille.net/wagon/men/5.jpg",
    description: "J'aime cuisiner pour les autres et rarement pour moi. J'ai tenu un restaurant pendant des années alors je sais ce que c'est. Du coup, quand j'ai envie d'un bon petit plat, je m'arrange pour en faire 5 ou 6 assiettes de plus, ça fait toujours plaisir. Non ? Allez, bon'ap les amis !",
    address: "14 rue d'Aubagne, 13002 Marseille"
  },
  {
    first_name: "Jules",
    last_name: "Gouffé",
    email: "julesgouffe@gmail.com",
    password: p,
    photo_url: "http://photos-famille.net/wagon/men/6.jpg",
    description: "Je suis pas bavard. Je cuisine mieux que je parle. A vous de juger.",
    address: "12 boulevard National, 13001 Marseille"
  },
  {
    first_name: "Stéphanie",
    last_name: "Le Bec",
    email: "stephlebec79@gmail.com",
    password: p,
    photo_url: "http://photos-famille.net/wagon/women/3.jpg",
    description: "J'aime tout ce qui est entrée froide (quiches, tartes, tourtes) et les salades. Charcuterie et fromage, il y a de quoi se régler sans passer des heures aux fourneaux.",
    address: "19 rue François Moisson, 13002 Marseille"
  }
]

users = []

users_attributes.each do |attributes|
  user = User.new(attributes)
  user.save!
  users << user
end

menus_attributes = [
  {
    price: 16,
    description: "Menu des amoureux",
    name: "Un petit voyage dans les saveurs du sud-ouest",
    starter: "Salade de jésiers au cresson, huile d'olive et petits magrets de canards",
    meal: nil,
    dessert: nil,
    portions: 8,
    availability: Date.today + 1,
    category: "dinner",
    photo_url: "http://photos-famille.net/wagon/menu/1.jpg"
  },0,
  {
    price: 12,
    description: "Petit diner à 2",
    name: "Du canard pour toi, mon canard ...",
    starter: nil,
    meal: "Confis de canard, pommes sautées",
    dessert: nil,
    portions: 6,
    availability: Date.today + 1,
    category: "lunch",
    photo_url: "http://photos-famille.net/wagon/menu/2.jpg"
  },0,
  {
    price: 8,
    description: "Par ici le Sud-Ouest !",
    name: "Du vert et des épices, sous le soleil du sud !",
    starter: "Petits magrets de canards",
    meal: "Confis de canard, pommes sautées",
    dessert: nil,
    portions: 2,
    availability: Date.today + 2,
    category: "dinner",
    photo_url: "http://photos-famille.net/wagon/menu/3.jpg"
  },0,
  {
    price: 12,
    description: "Gratin de potirons et boeuf",
    name: "Les enfants l'adore, les mamans aussi !",
    starter: "Salade de jésiers au cresson, huile d'olive et petits magrets de canards",
    meal: "Confis de canard, pommes sautées",
    dessert: nil,
    portions: 2,
    availability: Date.today + 3,
    category: "lunch",
    photo_url: "http://photos-famille.net/wagon/menu/4.jpg"
  },1,
  {
    price: 15,
    description: "Filet de limande",
    name: "Simple mais si savoureuse !",
    starter: "Salade de jésiers au cresson, huile d'olive et petits magrets de canards",
    meal: "Confis de canard, pommes sautées",
    dessert: nil,
    portions: 4,
    availability: Date.today + 1,
    category: "lunch",
    photo_url: "http://photos-famille.net/wagon/menu/5.jpg"
  },1,
  {
    price: 15,
    description: "Daube de Boeuf",
    name: "Un classique de la cuisine provençale, vé !",
    starter: "Salade de jésiers au cresson, huile d'olive et petits magrets de canards",
    meal: "Confis de canard, pommes sautées",
    dessert: nil,
    portions: 10,
    availability: Date.today + 1,
    category: "lunch",
    photo_url: "http://photos-famille.net/wagon/menu/6.jpg"
  },2,
  {
    price: 15,
    description: "Daube provençale à la canelle",
    name: "Une daube provençale avec un soupçon des îles",
    starter: "Salade de jésiers au cresson, huile d'olive et petits magrets de canards",
    meal: "Confis de canard, pommes sautées",
    dessert: nil,
    portions: 10,
    availability: Date.today - 8,
    category: "lunch",
    photo_url: "http://photos-famille.net/wagon/menu/6.jpg"
  },2,
  {
    price: 15,
    description: "Boeuf bourguignon",
    name: "Le classique des classiques, un bon boeuf bourguignon",
    starter: "Salade de jésiers au cresson, huile d'olive et petits magrets de canards",
    meal: "Confis de canard, pommes sautées",
    dessert: nil,
    portions: 10,
    availability: Date.today - 12,
    category: "lunch",
    photo_url: "http://photos-famille.net/wagon/menu/10.jpg"
  },2, {
    price: 8,
    description: "Poireaux au cumin",
    name: "Les fibres, les épices, la légéreté, votre corps va aimer",
    starter: "Salade de jésiers au cresson, huile d'olive et petits magrets de canards",
    meal: "Confis de canard, pommes sautées",
    dessert: nil,
    portions: 10,
    availability: Date.today + 1,
    category: "lunch",
    photo_url: "http://photos-famille.net/wagon/menu/7.jpg"
  },3,
  {
    price: 8,
    description: "Quiche aux poireaux",
    name: "C'est un incontournable de la cuisine Ardéchoise",
    starter: "Salade de jésiers au cresson, huile d'olive et petits magrets de canards",
    meal: "Confis de canard, pommes sautées",
    dessert: nil,
    portions: 10,
    availability: Date.today + 1,
    category: "lunch",
    photo_url: "http://photos-famille.net/wagon/menu/8.jpg"
  },3,{
    price: 17,
    description: "filets de rascasse safranés",
    name: "Le sud et ses spécialités, un régal pour le palais !",
    starter: "Salade de jésiers au cresson, huile d'olive et petits magrets de canards",
    meal: "Confis de canard, pommes sautées",
    dessert: nil,
    portions: 10,
    availability: Date.today + 1,
    category: "lunch",
    photo_url: "http://photos-famille.net/wagon/menu/9.jpg"
  },4
]

menus = []
menus_attributes.each_slice(2) do |chunk|
  menu = Menu.new(chunk[0])
  menu.user = users[chunk[1]]
  menu.save!
  menus << menu
end



# 5.times do |i|
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name
#   user = User.new({
#     first_name: first_name,
#     last_name: last_name,
#     email: "#{first_name}.#{last_name}@gmail.com",
#     password: "password",
#     photo_url:  "https://randomuser.me/api/portraits/men/#{i}.jpg",
#     description: Faker::Lorem.sentence(25),
#     address: Faker::Address.city
#     })
#   users << user
#   user.save!
# end

# menus = []

# photo_index = 1
# users.each do |user|
#   2.times do
#     menu = Menu.new({
#       name: Faker::Commerce.product_name,
#       description: Faker::Lorem.sentence,
#       price: Faker::Number.between(2, 15),
#       portions: Faker::Number.between(4, 8),
#       availability: DateTime.now,
#       user: user,
#       photo_url: "http://photos-famille.net/wagon/img#{photo_index}.jpg"
#       })
#     menus << menu
#     menu.save!
#     photo_index += 1
#     photo_index = 1 if photo_index == 4
#   end
# end

# simple_users = []

# 5.times do |i|
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name
#   user = User.new({
#      first_name: first_name,
#     last_name: last_name,
#     email: "#{first_name}.#{last_name}@gmail.com",
#     password: "password",
#     photo_url:  "https://randomuser.me/api/portraits/men/#{i+70}.jpg",
#     description: Faker::Lorem.sentence(25),
#     address: Faker::Address.city
#     })
#   simple_users << user
#   user.save!
# end

orders = []
user_index = 0
menus.each do |menu|
  1.times do |i|
    order = Order.new({
     date: menu.availability,
     approved: i.odd?,
     menu: menu
      })
    user_index += 1
    while !users[user_index].is_chef?
      user_index += 1
      user_index = 0 if user_index == users.length
    end
    order.user = users[user_index]
    order.portions = menu.portions - 1

    orders << order
    order.save!
  end
end

# menu sans order
menus_attributes = [
  {
    price: 12,
    description: "Sans order",
    name: "Menu des amoureux",
    starter: "Salade de jésiers au cresson, huile d'olive et petits magrets de canards",
    meal: "Confis de canard, pommes sautées",
    dessert: nil,
    portions: 8,
    availability: Date.today + 1,
    category: "dinner",
    photo_url: "http://photos-famille.net/wagon/menu/1.jpg"
  },0]

menus_attributes.each_slice(2) do |chunk|
  menu = Menu.new(chunk[0])
  menu.user = users[chunk[1]]
  menu.save!
  menus << menu
end




   # movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
