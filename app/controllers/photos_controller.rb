class PhotosController < ApplicationController
    def new
        @photo = Photo.new
        @categories = Category.find(:all).map { |c| [c.name, c.id] }
    end

    def index
        if params[:category_id]
            @category = Category.find_by_id(params[:category_id])
            @photos = Photo.find(:all, :conditions => { :category_id => params[:category_id] })
        else
            @photos = Photo.find(:all)
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
