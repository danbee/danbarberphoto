require 'spec_helper'

describe PagesController do
  describe "GET show" do
    let(:test_page) { create(:page) }

    it "renders a page" do
      get :show, name: test_page.name
      expect(response).to render_template(:show)
    end

    it "renders 404 for a non existant page" do
      get :show, name: "not-a-page"
      expect(response.status).to eql(404)
    end
  end
end
