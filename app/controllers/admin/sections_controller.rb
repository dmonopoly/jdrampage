class SectionsController < AdminController

  def show
    @section = Section.find(params[:id])
    @articles = @section.articles.paginate :page => (params[:page] or 1), :order => 'articles.created_at DESC'
  end
end
