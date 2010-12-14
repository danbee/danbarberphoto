class PhotosController < ApplicationController
    def new
        @photo = Photo.new
        @categories = Category.find(:all).map { |c| [c.name, c.id] }
    end

    def index
        if params[:category_id]
            @category = Category.find_by_id(params[:category_id])
            @photos = @category.photos.enabled.paginate(:page => params[:page], :per_page => 11)
        else
            @photos = Photo.enabled.paginate :all, :page => params[:page], :per_page => 11
        end
        respond_to do |format|
          format.html
        end
    end

    def show
        @photo = Photo.find(params[:id])
    end
end
