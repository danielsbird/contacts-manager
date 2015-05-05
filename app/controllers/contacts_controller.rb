class ContactsController < ApplicationController
    before_action :logged_in_user
    before_action :correct_user, only: [:show, :destroy]

    def new
        @contact = Contact.new
    end

    def show
        @contact = Contact.find(params[:id])
    end

    def create
        @contact = current_user.contact.build(contact_params)
        if @contact.save
            redirect_to user_path(@contact.user)
        else
            redirect_to user_path(@contact.user)
        end
    end

    def destroy
        @contact = Contact.find(params[:id]).destroy
        redirect_to user_path(@contact.user)
    end

    def edit
        @contact = Contact.find(params[:id])
    end

    def update
        @contact = Contact.find(params[:id])
        @contact.update_attributes(params.require(:contact).permit(:first_name, :last_name, :email, :phone_number))
        redirect_to @contact
    end

    private

        def logged_in_user
            unless logged_in?
                redirect_to login_path
            end
        end

        def correct_user
            @contact = Contact.find(params[:id])
            @user = @contact.user
            redirect_to(root_url) unless current_user?(@user)
        end

        def contact_params
            params.require(:contact).permit(:first_name, :last_name, :email, :phone_number)
        end
end
