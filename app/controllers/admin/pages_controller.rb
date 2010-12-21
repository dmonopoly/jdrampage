class Admin::PagesController < AdminController
  
  def show
    @page = Page.find(params[:id])
  end

end