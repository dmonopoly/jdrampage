class Admin::SectionsController < AdminController
	def index
		@sections = Section.all
	end

  def show
    @section = Section.find(params[:id])
    @articles = @section.articles.paginate :page => (params[:page] or 1), :order => 'articles.created_at DESC'
  end
  
	def sort
		params[:section_list].each_with_index do |id, index|
			Section.update_all ['position=?', index+1], ['id=?', id]
		end
		render :nothing => true
	end
	
end
