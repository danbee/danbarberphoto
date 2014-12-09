require 'spec_helper'

describe ContactsController, type: :controller do
  describe "GET new" do
    it "renders the contact form" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  let(:contact_params) do
    { name: "Dan Barber",
      email: "danbee@gmail.com",
      message: "This is a message." }
  end

  describe "POST create" do
    it "saves a new contact" do
      expect_any_instance_of(Contact).to receive(:save).once.and_return(true)
      post :create, contact: contact_params
      expect(flash[:notice]).to eql(I18n.t("contact.thanks"))
      expect(response).to redirect_to(:new_contact)
    end

    it "re-renders the form if params are missing" do
      post :create, contact: {}
      expect(flash[:alert]).to eql(I18n.t("contact.invalid"))
      expect(response).to render_template(:new)
    end
  end
end
