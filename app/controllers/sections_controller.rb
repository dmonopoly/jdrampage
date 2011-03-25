class SectionsController < ApplicationController

  def show
    @section = Section.find(params[:id])
		@articles = @section.articles.paginate :page => params[:page], :per_page => 10, :order => 'articles.section_position ASC'
  end

end

