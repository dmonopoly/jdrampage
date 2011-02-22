class Admin::CommentsController < AdminController

  def index
    @article = Article.find(params[:article_id])
    if @article.comments_allowed
      @comments = @article.comments
    else
      redirect_to @article
    end
  end
  
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(params[:comment])
    @comment.save
    redirect_to article_comments_path(@article)
  end
  
end
