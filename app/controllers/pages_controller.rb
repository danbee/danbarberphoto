class PagesController < ApplicationController
  layout "photos"
  
  def index
    @photo = Photo.first(:order => 'RANDOM()')
  end
end
