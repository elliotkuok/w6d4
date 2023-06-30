class AddUrlColumn < ActiveRecord::Migration[7.0]
  def change

    add_column :artworks, :image_url, :string, unique: true, null: false

  end
end
