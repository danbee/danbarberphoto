class PagesController < ApplicationController
  layout "photos"
  
  def index
    @photo = Photo.featured.order('RANDOM()').first
  end
  
  def about
    @content = Page.find_by_name('about')
  end
end
