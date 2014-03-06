class Admin::PagesController < Admin::AdminController

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(permitted_params)
      redirect_to admin_pages_path, notice: 'Page was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @page = Page.new(permitted_params)

    if @page.save
      redirect_to admin_pages_path, notice: 'Page was successfully added.'
    else
      render :edit
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    redirect_to admin_pages_path, notice: 'Page was deleted.'
  end

  private

  def permitted_params
    params.require(:page).permit(:name, :title, :content)
  end

end
