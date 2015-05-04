class ContactsController < ApplicationController
    before_action :logged_in_user
    before_action :correct_user

  def show
    @contact = Contact.find(params[:id])
  end

  def destroy
    @contact = Contact.find(params[:id]).destroy
    redirect_to user_path(@contact.user)
  end

   def logged_in_user
        unless logged_in?
            redirect_to root_url
        end
    end

    def correct_user
        @contact = Contact.find(params[:id])
        @user = @contact.user
        redirect_to(root_url) unless current_user?(@user)
    end
end
