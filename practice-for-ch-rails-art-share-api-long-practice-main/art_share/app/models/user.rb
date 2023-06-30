
#       create_table "users", force: :cascade do |t|
#     t.string "username", null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false

class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :artworks,
        foreign_key: :artist_id,
        dependent: :destroy
        #add inverse_of

    has_many :artwork_shares,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare,
        #add inverse_of
        dependent: :destroy

    has_many :shared_artworks,
        through: :artwork_shares,
        source: :artwork

end
