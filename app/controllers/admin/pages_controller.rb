class Admin::PagesController < AdminController
  
	def index
		@pages = Page.all
	end
	
  def show
    @page = Page.find(params[:id])
  end

end