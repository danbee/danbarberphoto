class PagesController < ApplicationController
  layout "photos"
  
  def index
    @photo = Photo.featured.order('RANDOM()').first
  end
  
  def about
    @page = Page.find_by_name('about')
    @content = @page.content
  end
end
