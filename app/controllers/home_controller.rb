class HomeController < ApplicationController
  def index
    @photo = Photo.featured.order('RANDOM()').first
  end
end
