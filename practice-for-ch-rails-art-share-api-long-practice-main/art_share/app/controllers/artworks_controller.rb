class ArtworksController < ApplicationController

    def index
        if params[:user_id]
            artworks = Artwork.where(artworks: {artist_id: params[:user_id]})
        else
            artworks = Artwork.all
        end
        render json: artworks
    end

    def show
        artwork = Artwork.find_by(id: params[:id])
        if artwork
            render json: artwork
        else
            render json: 'User not found', status: 404
        end
    end
    
    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork 
        else
            render json: artwork.errors.full_messages, status: 422
        end
        
    end

    def destroy
        artwork = Artwork.find_by(id: params[:id])
        artwork.destroy
        redirect_to artworks_url
    end
    
    def update
        artwork = Artwork.find_by(id: params[:id])

        if artwork.update(artwork_params)
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    private
    def artwork_params
        params.require(:artwork).permit(:title, :artist_id, :image_url)
    end

# t.string "title", null: false
# t.bigint "artist_id", null: false

# t.string "image_url", null: false
    
end
