require 'spec_helper'

describe PhotosController, type: :controller do
  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET log_view" do
    let(:photo) { create(:photo) }

    it "logs a photo view" do
      expect_any_instance_of(Photo).to receive(:log_view).once
      get :log_view, id: photo.id
      expect(response).to be_successful
    end

    it "responds with not_found if the photo isn't present" do
      get :log_view, id: 999
      expect(response.status).to eql(404)
    end
  end
end
