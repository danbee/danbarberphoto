class ContactsController < ApplicationController
  layout "photos"

  def new
    @contact = Contact.new(:id => 1)
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      redirect_to(:new_contact, :notice => "Thanks for your email, I'll be in touch as soon as possible.")
    else
      flash[:alert] = "Please fill in fields marked in red."
      render :new
    end
  end
end
