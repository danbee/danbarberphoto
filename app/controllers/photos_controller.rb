class PhotosController < ApplicationController
  def index
    if params[:category_id]
      for_category(params[:category_id])
    else
      all
    end

    @num_blank = 11 - @photos.length

    respond_to do |format|
      format.html
    end
  end

  private

  def for_category(category_id)
    @category = Category.find_by_id(category_id)
    @photos = @category.photos.enabled.order { taken_at.desc }
              .page(params[:page])
    @page_title = @category.name
  end

  def all
    @photos = Photo.enabled.order { taken_at.desc }
              .page(params[:page])
    @page_title = 'All Photos'
  end
end
