class CategoriesController < ApplicationController
  layout "photos"
  # GET /categories
  # GET /categories.xml
  def index
    @categories = Category.order('sort ASC').paginate :page => params[:page], :per_page => 4

    @photos = Photo.featured.limit(2).order('RANDOM()')

    @page_title = 'Portfolio'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.xml
  def show
    @category = Category.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category }
    end
  end

end
