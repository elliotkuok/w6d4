

# t.string "title", null: false
# t.bigint "artist_id", null: false
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.string "image_url", null: false
# t.index ["artist_id"], name: "index_artworks_on_artist_id", unique: true
# t.index ["title", "artist_id"], name: "index_artworks_on_title_and_artist_id", unique: true
# t.index ["title"], name: "index_artworks_on_title", unique: true

class Artwork < ApplicationRecord
    validates :title, :artist_id, :image_url, presence: true
    validates :title, uniqueness: {scope: :artist_id}
    validates :image_url, uniqueness: true

    belongs_to :artist,
        class_name: :User

    has_many :artwork_shares,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare
        #add inverse_of

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer
end