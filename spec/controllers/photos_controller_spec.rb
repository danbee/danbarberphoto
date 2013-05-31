require 'spec_helper'

describe PhotosController do
  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET log_view" do
    let(:photo) { create(:photo) }

    it "logs a photo view" do
      photo.should_receive(:log_view).once
      get :log_view, id: photo.id
    end
  end
end
