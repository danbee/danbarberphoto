class CategoriesController < ApplicationController
  layout "photos"
  # GET /categories
  # GET /categories.xml
  def index
    @categories = Category.paginate :all, :page => params[:page], :per_page => 4

    @num_categories = @categories.count

    @photos = Photo.all(:limit => 2, :order => 'RANDOM()', :conditions => { :featured => true, :enabled => true })

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
