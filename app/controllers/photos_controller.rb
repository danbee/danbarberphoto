class PhotosController < ApplicationController
  def index
    if params[:category_id]
      @category = Category.find_by_id(params[:category_id])
      @photos = @category.photos.enabled.order{taken_at.desc}.paginate(:page => params[:page], :per_page => 11)
      @page_title = @category.name
    else
      @photos = Photo.enabled.order{taken_at.desc}.paginate(:page => params[:page], :per_page => 11)
      @page_title = 'All Photos'
    end
    respond_to do |format|
      format.html
    end
  end

  def log_view
    photo = Photo.find_by_id(params[:id])
    if photo.present?
      photo.log_view
      head :ok
    else
      head :not_found
    end
  end
end
