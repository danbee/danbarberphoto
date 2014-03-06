class Admin::CategoriesController < Admin::AdminController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(permitted_params)
      redirect_to admin_categories_path, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @category = Category.new(permitted_params)

      if @category.save
        redirect_to admin_categories_path, notice: 'Category was successfully added.'
      else
        render :edit
      end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to admin_categories_path, notice: 'Category was deleted.'
  end

  private

  def permitted_params
    params.require(:category).permit(:name, :slug, :description, :base_colour, :sort)
  end

end
