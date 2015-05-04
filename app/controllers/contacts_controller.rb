class ContactsController < ApplicationController
  def show
    @contact = Contact.find(params[:id])
  end

  def destroy
    @contact = Contact.find(params[:id]).destroy
    redirect_to user_path(@contact.user)
  end
end
