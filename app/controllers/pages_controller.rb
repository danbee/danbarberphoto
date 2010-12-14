class PagesController < ApplicationController
  layout "photos"
  
  def index
    @photo = Photo.where(:featured => true).where(:enabled => true).order('RANDOM()').first
  end
  
  def about
    @content = Page.find_by_name('about')
  end
end
