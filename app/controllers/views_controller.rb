class ViewsController < ApplicationController
  def create
    photo = Photo.find_by_id(params[:photo_id])

    if photo.present?
      photo.log_view
      head :ok
    else
      head :not_found
    end
  end
end
