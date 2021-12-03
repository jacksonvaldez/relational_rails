# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bakery.destroy_all
Baker.destroy_all
Artist.destroy_all
Song.destroy_all


bakery_1 = Bakery.create!(name: "Dunkin Donuts", is_open: false, customer_capacity: 10)
bakery_2 = Bakery.create!(name: "Tim Hortons", is_open: false, customer_capacity: 5)
bakery_3 = Bakery.create!(name: "Starbucks", is_open: true, customer_capacity: 10)

baker_1 = Baker.create!(name: 'Jon Doe', is_working: true, salary: 10000, bakery_id: bakery_1.id)
baker_5 = Baker.create!(name: "Jane Smith", is_working: false, salary: 250, bakery_id: bakery_2.id)
baker_2 = Baker.create!(name: 'andrew jackson', is_working: true, salary: 15000, bakery_id: bakery_2.id)
baker_3 = Baker.create!(name: "John Smith", is_working: true, salary: 300, bakery_id: bakery_2.id)
baker_7 = Baker.create!(name: "Mike Jones", is_working: false, salary: 254, bakery_id: bakery_3.id)
baker_6 = Baker.create!(name: "Joe Dirt", is_working: true, salary: 230, bakery_id: bakery_3.id)



artist_1 = Artist.create!(name: 'Prince', alive: false, monthly_listeners: 50000)
artist_2 = Artist.create!(name: "Doja Cat", alive: true, monthly_listeners: 190000)
artist_3 = Artist.create!(name: "Kanye West", alive: true, monthly_listeners: 100000)
artist_4 = Artist.create!(name: "Ice Cube", alive: true, monthly_listeners: 30000)
artist_5 = Artist.create!(name: "Ariana Grande", alive: true, monthly_listeners: 150000)

song_2 = Song.create!(name: 'Purple Rain', top_100: false, length_s: 100, artist_id: artist_1.id)
song_3 = Song.create!(name: 'Dove Cry', top_100: true, length_s: 150, artist_id: artist_1.id)
song_1 = Song.create!(name: 'Say So', top_100: true, length_s: 209, artist_id: artist_2.id)
song_5 = Song.create!(name: "Gold Digger", top_100: false, length_s: 250, artist_id: artist_3.id)
song_4 = Song.create!(name: "Flashing Lights", top_100: true, length_s: 300, artist_id: artist_3.id)
song_9 = Song.create!(name: "Side to Side", top_100: false, length_s: 254, artist_id: artist_5.id)
song_8 = Song.create!(name: "Seven Rings", top_100: true, length_s: 230, artist_id: artist_5.id)
