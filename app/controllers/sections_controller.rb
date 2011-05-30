class SectionsController < ApplicationController

  def show
    @section = Section.find(params[:id])
		@articles = @section.articles.paginate :page => params[:page], :per_page => 6, :order => 'articles.section_position ASC',
		                                        :total_entries => 10 # TEMPORARY to limit number of pages b/c of utf8 problem
  end

end

