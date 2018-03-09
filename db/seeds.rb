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
    content: "Hallo %%%,

ich wünsche dir alles gute zum Geburtstag und hoffe du verlebst einen tollen Tag! Hier mal ein kurzer Geburtstagsgruß von mir:

https://vimeo.com/219842630

Lieben Gruß 

Jasper Teßmann
Scharnhorststr. 1c | Campus Center 
21335 Lüneburg

Mobil : 0172 5174465
Jasper@fruehstarter.net
www.frühstarter.de",
    datum: Date.today,
    activator: false)


first.users.create!(
    firstname: "Nils",
    lastname: "Kaden",
    email: "nils.kaden@me.com",
    birthday: Date.new(1994, 12, 1),
    female: false)

first.users.create!(
    firstname: "Hue",
    lastname: "Huehue",
    email: "hue@example.com",
    birthday: Date.today,
    female: true)