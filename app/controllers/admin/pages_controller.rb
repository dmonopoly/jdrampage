class Admin::PagesController < AdminController

	def index
		@pages = Page.all
	end

  def show
    @page = Page.find(params[:id])
  end

	def sort
		params[:page_list].each_with_index do |id, index|
			Page.update_all ['position=?', index+1], ['id=?', id]
		end
		render :nothing => true
	end
end

