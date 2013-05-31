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
      Photo.any_instance.should_receive(:log_view).once
      get :log_view, id: photo.id
      should respond_with(:success)
    end

    it "responds with not_found if the photo isn't present" do
      get :log_view, id: 999
      should respond_with(:not_found)
    end
  end
end
