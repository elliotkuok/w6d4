class ArtworkSharesController < ApplicationController
    
    def create
        workshare = ArtworkShare.new(strong_params)
        if workshare.save
            render json: workshare
        else
            render json: workshare.errors.full_messages, status: 422
        end
    end


    def destroy
        artwork_share = ArtworkShare.find_by(id: params[:id])
        artwork_share.destroy
        render json: artwork_share
    end
        
    private
    def strong_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end

end
