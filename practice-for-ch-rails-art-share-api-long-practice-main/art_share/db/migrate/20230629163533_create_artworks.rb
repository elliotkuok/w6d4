class CreateArtworks < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|

      t.string :title, null: false, index: {unique: true}
      t.string :image_url, null: false, index: {unique: true}
      t.references :artist, null: false, index: {unique: true},  foreign_key: {to_table: :users}

      t.timestamps
    end

  end
end
