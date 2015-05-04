class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @contacts = @user.contact
    end
end
