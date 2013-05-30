class PagesController < ApplicationController
  def show
    @page = Page.find_by_name!(params[:name])
    @page_title = @page.title
  end
end
