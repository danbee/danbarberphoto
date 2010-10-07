class PhotosController < ApplicationController
    def new
        @photo = Photo.new
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
