class PagesController < ApplicationController
  layout "photos"
  
  def index
    @photo = Photo.first(:order => 'RANDOM()')
  end
  
  def about
    @content = Page.find_by_name('about')
  end
end
