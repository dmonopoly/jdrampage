class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    @section = @article.section
  end
end
