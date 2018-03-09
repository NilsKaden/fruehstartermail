# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


first = Group.create!(
    name: "Freunde",
    subject: "Alles Gute!",
    content: "<p>Hi %%%,</p> <p>alles Liebe zum Geburtstag!</p> <p>Jasper</p>",
    datum: Date.today,
    activator: false)


first.users.create!(
    firstname: "Nils",
    lastname: "Kaden",
    email: "nils.kaden@me.com",
    birthday: Date.new(1994, 12, 1),
    female: false)
