require 'spec_helper'

describe HomeController do
  describe "GET index" do
    it "responds with success" do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
