class CategoriesController < ApplicationController
  # GET /categories
  # GET /categories.xml
  def index
    @categories = Category.order("sort ASC").page(params[:page]).per(4)

    @photos = Photo.featured.limit(2).order("RANDOM()")

    @page_title = "Portfolio"

    @num_blank = 4 - @categories.length
  end

  # GET /categories/1
  # GET /categories/1.xml
  def show
    @category = Category.find(params[:id])
  end
end
