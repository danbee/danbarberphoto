class PagesController < ApplicationController
  layout "photos"
  
  def index
    @photo = Photo.first(:order => 'RANDOM()', :conditions => { :featured => true })
  end
  
  def about
    @content = Page.find_by_name('about')
  end
end
