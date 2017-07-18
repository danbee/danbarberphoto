require 'spec_helper'

describe ContactsController, type: :controller do
  describe 'GET new' do
    it 'renders the contact form' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  let(:contact_params) do
    {
      name: 'Dan Barber',
      email: 'danbee@gmail.com',
      message: 'This is a message.',
    }
  end

  describe 'POST create' do
    it 'saves a new contact' do
      valid_contact = double(valid?: true)
      allow(Contact).to receive(:new).and_return(valid_contact)
      allow(Notifier).to receive(:contact_notification).and_return(double(deliver: true))
      post :create, params: { contact: contact_params }

      expect(Notifier).to have_received(:contact_notification).with(valid_contact)
      expect(flash[:notice]).to eql(I18n.t('contact.thanks'))
      expect(response).to redirect_to(:new_contact)
    end

    it 're-renders the form if params are missing' do
      allow(Contact).to receive(:new).and_return(double(valid?: false))
      post :create, params: { contact: {} }
      expect(flash[:alert]).to eql(I18n.t('contact.invalid'))
      expect(response).to render_template(:new)
    end
  end
end
