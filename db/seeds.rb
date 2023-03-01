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
u = User.create!(email: "aurore@test.com", password: "auroretest", password_confirmation: "auroretest")

user = User.all.sample
file = URI.open("https://i.pinimg.com/564x/63/c9/e3/63c9e3898b534be37eee0dbb777204e1.jpg")
costume = Costume.new(
  name: "Dragon",
  category: "Fantastic beasts",
  size: "L",
  price: 19.99,
  location: "25 rue Doudeauville, 75018 PARIS"
)
costume.photo.attach(io: file, filename: "dragoness.png", content_type: "image/png")
costume.user = user
costume.save!

file2 = URI.open("https://i.pinimg.com/564x/9b/a7/b5/9ba7b5d376047fa973740704e0768f20.jpg")
costume2 = Costume.new(
  name: "Mother of Dragons",
  category: "Character",
  size: "S",
  price: 55.99,
  location: "16 avenue de Laumière, 75019 PARIS"
)
costume2.photo.attach(io: file2, filename: "dani.png", content_type: "image/png")
costume2.user = user
costume2.save

file3 = URI.open("https://i.pinimg.com/564x/ae/a1/ed/aea1ed522805bac3ba96de1538e82d7a.jpg")
costume3 = Costume.new(
  name: "Jon Snow",
  category: "Character",
  size: "XL",
  price: 47.99,
  location: "5 rue calmels prolongée, 75018 PARIS"
)
costume3.photo.attach(io: file3, filename: "jon.png", content_type: "image/png")
costume3.user = user
costume3.save

file4 = URI.open("https://i.pinimg.com/564x/10/55/df/1055df347fe6c3b32c8ad9cfcda7b28d.jpg")
costume4 = Costume.new(
  name: "Unicorn",
  category: "Fantastic beasts",
  size: "XS",
  price: 74.99,
  location: "13 rue pigalle, 75010 PARIS"
)
costume4.photo.attach(io: file4, filename: "licorne.png", content_type: "image/png")
costume4.user = user
costume4.save

file5 = URI.open("https://i.pinimg.com/564x/10/55/df/1055df347fe6c3b32c8ad9cfcda7b28d.jpg")
costume4 = Costume.new(
  name: "Unicorn",
  category: "Fantastic beasts",
  size: "XS",
  price: 74.99
)
costume4.photo.attach(io: file4, filename: "licorne.png", content_type: "image/png")
costume4.user = user
costume4.save

