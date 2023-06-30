
# create_table "artwork_shares", force: :cascade do |t|
#     t.bigint "artwork_id", null: false
#     t.bigint "viewer_id", null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["artwork_id"], name: "index_artwork_shares_on_artwork_id"
#     t.index ["viewer_id", "artwork_id"], name: "index_artwork_shares_on_viewer_id_and_artwork_id", unique: true
#     t.index ["viewer_id"], name: "index_artwork_shares_on_vie

class ArtworkShare < ApplicationRecord
    validates :artwork_id, :viewer_id, presence: true
    validates :artwork_id, uniqueness: {scope: :viewer_id}

    belongs_to :viewer,
        class_name: :User

    belongs_to :artwork

end