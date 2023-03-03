# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"

Costume.destroy_all
User.destroy_all
u1 = User.create!(email: "alessia@test.com", password: "auroretest", password_confirmation: "auroretest", first_name: "Alessia")
u2 = User.create!(email: "olga@test.com", password: "auroretest", password_confirmation: "auroretest", first_name: "Olga")
u3 = User.create!(email: "martial@test.com", password: "auroretest", password_confirmation: "auroretest", first_name: "Martial")
u = User.create!(email: "aurore@test.com", password: "auroretest", password_confirmation: "auroretest", first_name: "Aurore")

user = User.all.sample
file = URI.open("https://i.ebayimg.com/images/g/UxQAAOSwDO1j50E1/s-l1600.jpg")
file1 = URI.open("https://i.ebayimg.com/images/g/VZYAAOSw4jFj50E0/s-l1600.jpg")
file2 = URI.open("https://i.ebayimg.com/images/g/OJIAAOSwJshj50Ez/s-l1600.jpg")
costume = Costume.new(
  name: "Enchanted Unicorn",
  category: "Unicorn",
  size: "s",
  price: 19.99,
  location: "25 rue Doudeauville, 75018 PARIS",
  description: "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. "
)
costume.photos.attach(io: file, filename: "unicorn.png", content_type: "image/png")
costume.photos.attach(io: file1, filename: "unicorn.png", content_type: "image/png")
costume.photos.attach(io: file2, filename: "unicorn.png", content_type: "image/png")
costume.user = user
costume.save!

file2 = URI.open("https://i.mmo.cm/is/image/mmoimg/mw-product-zoom/deguisement-de-licorne-couleurs-pastel--mw-135984-1.jpg")
file3 = URI.open("https://i.mmo.cm/is/image/mmoimg/mw-product-zoom/deguisement-de-licorne-couleurs-pastel--mw-135984-2.jpg")
costume2 = Costume.new(
  name: "Rainbow Unicorn",
  category: "Unicorn",
  size: "S",
  price: 15.99,
  location: "16 avenue de Laumière, 75019 PARIS",
  description: "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. "
)
costume2.photos.attach(io: file2, filename: "unicornpastel.png", content_type: "image/png")
costume2.photos.attach(io: file3, filename: "unicornpastel.png", content_type: "image/png")
costume2.user = user
costume2.save

file3 = URI.open("https://m.media-amazon.com/images/I/51SZnl4bALL._AC_UL1001_.jpg")
file4 = URI.open("https://m.media-amazon.com/images/I/51hGlkr7ieL._AC_UL1001_.jpg")
file5 = URI.open("https://m.media-amazon.com/images/I/51erm1DdR4L._AC_UL1001_.jpg")
costume3 = Costume.new(
  name: "Belle",
  category: "Character",
  size: "S",
  price: 10.99,
  location: "5 rue calmels prolongée, 75018 PARIS",
  description: "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas."
)
costume3.photos.attach(io: file3, filename: "pricessgold.png", content_type: "image/png")
costume3.photos.attach(io: file4, filename: "princessgold.png", content_type: "image/png")
costume3.photos.attach(io: file5, filename: "princessgold.png", content_type: "image/png")
costume3.user = user
costume3.save

file4 = URI.open("https://m.media-amazon.com/images/I/510smS7vX8L._AC_UL1001_.jpg")
file5 = URI.open("https://m.media-amazon.com/images/I/51OBdwNLN-L._AC_UL1001_.jpg")
file6 = URI.open("https://m.media-amazon.com/images/I/51l1uSpbrTL._AC_UL1001_.jpg")
costume4 = Costume.new(
  name: "Cinderella",
  category: "Character",
  size: "S",
  price: 10.99,
  location: "9 rue calmels prolongée, 75018 PARIS",
  description: "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas."
)
costume4.photos.attach(io: file4, filename: "pricessblue.png", content_type: "image/png")
costume4.photos.attach(io: file5, filename: "princessblue.png", content_type: "image/png")
costume4.photos.attach(io: file6, filename: "princessblue.png", content_type: "image/png")
costume4.user = user
costume4.save

file7 = URI.open("https://m.media-amazon.com/images/I/71zHdmHLLvL._AC_SL1500_.jpg")
file8 = URI.open("https://m.media-amazon.com/images/I/61ygOgvKqsS._AC_SL1500_.jpg")

 costume5 = Costume.new(
  name: "Witch",
  category: "Witch",
  size: "XS",
  price: 22.99,
  location: "13 rue pigalle, 75010 PARIS",
  description: "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas."
 )
costume5.photos.attach(io: file7, filename: "licorne.png", content_type: "image/png")
costume5.photos.attach(io: file8, filename: "licorne.png", content_type: "image/png")
costume5.user = user
costume5.save
