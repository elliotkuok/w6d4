class UsersController < ApplicationController
    def index
        users = User.all
        render json: users.artworks
    end

    def create
        user = User.new(user_params)
        
        if user.save
            render json: user
        else
            render json: user.error.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        user = User.find_by(id: params[:id])
        user.destroy
        redirect_to users_url
    end
 
    def show 
        user = User.find_by(id: params[:id])
        if user
            render json: user
        else   
            render json: 'User not found', status: 404
        end
    end


    def update
        user = User.find_by(id: params[:id])
        if user.update(user_params)
            render json: user
        else   
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end



    private
    def user_params
        params.require(:user).permit(:username)
    end
    
end
