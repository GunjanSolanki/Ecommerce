# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




User.create(name: "admin", email: "admin@onlineshop.com", 
            contact: "7748020946", address: "100A/C silicon valley",
            gender: "male", is_admin: true, password: "123123")


User.create(name: "testuser", email: "testuser@onlineshop.com", 
  contact: "7748020946", address: "101A/C silicon valley",
  gender: "male", is_admin: false, password: "123123")

Category.create(name: "book")
Category.create(name: "electronics")
Category.create(name: "utensils")
Category.create(name: "groceries")
Category.create(name: "clothes")
