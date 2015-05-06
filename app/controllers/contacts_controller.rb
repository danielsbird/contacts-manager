class ContactsController < ApplicationController
    before_action :logged_in_user

    def new
        @contact = Contact.new
    end

    def show
        @contact = current_user.contacts.find(params[:id])
    end

    def index
        @contacts = current_user.contacts.order('last_name')
    end

    def create
        @contact = current_user.contacts.build(contact_params)
        if @contact.save
            redirect_to contacts_path
        else
            redirect_to contacts_path
        end
    end

    def destroy
        @contact = current_user.contacts.find(params[:id]).destroy
        redirect_to contacts_path
    end

    def edit
        @contact = current_user.contacts.find(params[:id])
    end

    def update
        @contact = current_user.contacts.find(params[:id])
        @contact.update_attributes(params.require(:contact).permit(:first_name, :last_name, :email, :phone_number))
        redirect_to @contact
    end

    private

        def logged_in_user
            unless logged_in?
                redirect_to login_path
            end
        end

        def contact_params
            params.require(:contact).permit(:first_name, :last_name, :email, :phone_number)
        end
end
