class ContactsController < ApplicationController
  def new
    @contact = Contact.new(:id => 1)
    @page_title = 'Contact'
  end

  def create
    @contact = Contact.new(permitted_params)
    if @contact.save
      redirect_to(:new_contact, :notice => t("contact.thanks"))
    else
      flash[:alert] = t("contact.invalid")
      render :new
    end
  end

  private

  def permitted_params
    params.require(:contact).permit(:id, :email, :subject, :name, :message)
  end
end
