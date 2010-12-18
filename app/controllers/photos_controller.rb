class PhotosController < ApplicationController
  def new
    @photo = Photo.new
    @categories = Category.find(:all).map { |c| [c.name, c.id] }
  end

  def index
    if params[:category_id]
      @category = Category.find_by_id(params[:category_id])
      @photos = @category.photos.enabled.order(:taken_at.desc).paginate(:page => params[:page], :per_page => 11)
    else
      @photos = Photo.enabled.order(:taken_at.desc).paginate :all, :page => params[:page], :per_page => 11
    end
    respond_to do |format|
      format.html
    end
  end

  def show
    # Log the view
    @photo = Photo.find(params[:id])
    @photo.log_view
    # Get the image and send it to the browser
    data = File.open(@photo.photo.path, 'rb').read
    send_data(data , :filename => 'photo', :type => 'image/jpg', :disposition => 'inline')
  end
end
