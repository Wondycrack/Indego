class UsersController < ApplicationController
    def index
        @users = User.all
    end
    
      def show
        @user = User.find(params[:id])
      end
      
      def new
        # get a blank user record
        @user = User.new
      end
    
      def create
        @user = user.new(user_params)
    
        if @user.save
          redirect_to user_path(@user)
        else
          render :new
        end
      end
    
      def edit
        # form with user info filled out
        @user = user.find(params[:id])
      end
    
    
      def update
        @user.update(user_params)
        # redirect to the show page
        redirect_to @user
      end
    
    
      def destroy
        @user.destroy
        redirect_to users_path
      end
    
      private
    
      def set_user
        @user = user.find(params[:id])
      end

    
      def user_params
        # params[:user] => { name: params[:name].... }
        params.require(:user).permit(:name)
      end
end
