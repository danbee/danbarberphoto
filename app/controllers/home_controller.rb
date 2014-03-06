class HomeController < ApplicationController
  def index
    @photos = Photo.featured.order('RANDOM()').limit(1)
  end
end
