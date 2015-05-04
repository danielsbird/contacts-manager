class UsersController < ApplicationController

    before_action :logged_in_user
    before_action :correct_user

    def show
        @user = User.find(params[:id])
        @contacts = @user.contact
    end

     def logged_in_user
        unless logged_in?
            redirect_to root_url
        end
    end

    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
    end
end
