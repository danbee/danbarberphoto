class PhotosController < ApplicationController
    def new
        @photo = Photo.new
        @categories = Category.find(:all).map { |c| [c.name, c.id] }
    end

    def index
        if params[:category_id]
            @category = Category.find_by_id(params[:category_id])
            @photos = @category.photos.paginate :page => params[:page], :per_page => 11
            @num_photos = @photos.count
        else
            @photos = Photo.paginate :all, :page => params[:page], :per_page => 11
            @num_photos = @photos.count
        end
    end
    
    def create
        @photo = Photo.new(params[:photo])
        if @photo.save
            flash[:notice] = 'Photo was successfully saved'
            redirect_to photo_url(@photo)
        else
            render :action => :new
        end
    end

    def show
        @photo = Photo.find(params[:id])
    end
end
