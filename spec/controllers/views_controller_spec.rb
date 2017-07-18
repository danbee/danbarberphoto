require 'spec_helper'

RSpec.describe ViewsController, type: :controller do
  describe 'POST create' do
    let(:photo) { create(:photo) }

    it 'logs a photo view' do
      expect_any_instance_of(Photo).to receive(:log_view).once
      post :create, params: { photo_id: photo.id }
      expect(response).to be_successful
    end

    it 'responds with not_found if the photo is not present' do
      post :create, params: { photo_id: 999 }
      expect(response.status).to eql(404)
    end
  end
end
