class DeleteColumnsArtworks < ActiveRecord::Migration[7.0]
  def change
    remove_index :artworks, column: :artist_id
    remove_index :artworks, column: :title
  end
end
