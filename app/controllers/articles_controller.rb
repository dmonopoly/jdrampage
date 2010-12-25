class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    @section = @article.section

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end
end
