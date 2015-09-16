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

  def log_view
    photo = Photo.find_by_id(params[:id])
    if photo.present?
      photo.log_view
      head :ok
    else
      head :not_found
    end
  end

  private

  def with_category(category_id)
    @category = Category.find_by_id(category_id)
    @photos = @category.photos.enabled.order { taken_at.desc }
              .paginate(page: params[:page], per_page: 11)
    @page_title = @category.name
  end

  def alls
    @photos = Photo.enabled.order { taken_at.desc }
              .paginate(page: params[:page], per_page: 11)
    @page_title = 'All Photos'
  end
end
