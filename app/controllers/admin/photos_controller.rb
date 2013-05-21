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

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to(admin_photos_path, :notice => 'Photo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  def create
    @photo = Photo.new(params[:photo])

    respond_to do |format|
      if @photo.save
        format.html { redirect_to(admin_photos_path, :notice => 'Photo was successfully added.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to(admin_photos_path, :notice => 'Photo was deleted.') }
      format.xml  { head :ok }
    end
  end

  private

  def get_categories
    @categories = Category.all
  end

end
