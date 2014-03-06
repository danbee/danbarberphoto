class Admin::PhotosController < Admin::AdminController
  before_filter :get_categories

  def index
    @photos = Photo.paginate(:page => params[:page])
  end

  def new
    @photo = Photo.new
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])

    if @photo.update_attributes(params[:photo])
      redirect_to admin_photos_path, notice: 'Photo was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @photo = Photo.new(params[:photo])

      if @photo.save
        redirect_to admin_photos_path, notice: 'Photo was successfully added.'
      else
        render :edit
      end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    redirect_to admin_photos_path, notice: 'Photo was deleted.'
  end

  private

  def get_categories
    @categories = Category.all
  end

end
