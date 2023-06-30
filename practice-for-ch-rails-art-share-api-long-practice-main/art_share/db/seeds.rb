# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#DROP THE DATA
ArtworkShare.destroy_all
Artwork.destroy_all
User.destroy_all

#RESET THE PRIMARY KEY SEQUENCE FOR EACH TABLE
ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('artworks')
ActiveRecord::Base.connection.reset_pk_sequence!('artwork_shares')

# USERS
puts "Seeding Users...."
# u1 = User.create!(username: :bananaa)
# u2 = User.create!(username: :ncar285)
# u3 = User.create!(username: :banksy)
# u4 = User.create!(username: :eltkuak)
u1 = User.create!(username: "bananaa")
u2 = User.create!(username: "ncar285")
u3 = User.create!(username: "banksy")
u4 = User.create!(username: "eltkuak")
puts "Done Seeding Users!"

# ARTWORKS
puts "Seeding Artworks...."
a1 = Artwork.create!(title: "Banana Stuck to the Wall", artist_id: u2.id, image_url: "www.bsttw.com" )
a2 = Artwork.create!(title: "valleyOFdispair", artist_id: u1.id, image_url: "www.valleyOFdispair.com" )
a3 = Artwork.create!(title: "Jepardy Tiger", artist_id: u3.id, image_url: "www.jeptiger.art_today.com" )
a4 = Artwork.create!(title: "Bansky's Monolisa", artist_id: u4.id, image_url: "www.banksy__mona.com" )
a5 = Artwork.create!(title: "|| ++ ||", artist_id: u1.id, image_url: "www.fhjeytertsghwr.com" )
a6 = Artwork.create!(title: "Chicken wings!!", artist_id: u3.id, image_url: "www.chickenwings.com" )
a7 = Artwork.create!(title: "American Gothic", artist_id: u1.id, image_url: "www.gothicamericans.com" )
puts "Done Seeding Artworks!"

# # ARTWORK SHARES (spaces between seperate artworks)
puts "Seeding Atrwork Shares...."
ArtworkShare.create!(viewer_id: u1.id, artwork_id: a1.id)   #!u2
ArtworkShare.create!(viewer_id: u3.id, artwork_id: a1.id)   #!u2
ArtworkShare.create!(viewer_id: u4.id, artwork_id: a1.id)   #!u2

ArtworkShare.create!(viewer_id: u2.id, artwork_id: a2.id)    #!u1
ArtworkShare.create!(viewer_id: u4.id, artwork_id: a2.id)    #!u1
ArtworkShare.create!(viewer_id: u3.id, artwork_id: a2.id)    #!u1

ArtworkShare.create!(viewer_id: u1.id, artwork_id: a3.id)    #!u3
ArtworkShare.create!(viewer_id: u2.id, artwork_id: a3.id)    #!u3

ArtworkShare.create!(viewer_id: u3.id, artwork_id: a4.id)   #!u4
ArtworkShare.create!(viewer_id: u1.id, artwork_id: a4.id)   #!u4

ArtworkShare.create!(viewer_id: u2.id, artwork_id: a5.id)   #!u1

ArtworkShare.create!(viewer_id: u2.id, artwork_id: a6.id)    #!u3

ArtworkShare.create!(viewer_id: u4.id,  artwork_id: a7.id)   #!u1
puts "Done Seeding Artwork Shares!"




# .string "title", null: false
# t.bigint "artist_id", null: false
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.string "image_url", null: false
# t.index ["artist_id"], name: "index_artworks_on_artist_id", unique: true
# t.index ["title", "artist_id"], name: "index_artworks_on_title_and_artist_id", unique: true
# t.in
