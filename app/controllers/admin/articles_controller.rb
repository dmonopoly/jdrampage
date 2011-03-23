class Admin::ArticlesController < AdminController

  def index
    @articles = Article.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        flash[:notice] = 'Article was successfully created.'
				@article.move_to_top # move article to first of all articles by changing its position to 1
				move_to_top_in_section(@article) # defined in admin article helper
				
        format.html { redirect_to(admin_article_path(@article)) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        flash[:notice] = 'Article was successfully updated.'
        format.html { redirect_to(admin_article_path(@article)) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(admin_articles_path) }
    end
  end

	def sort
		params[:article_list].each_with_index do |id, index|
			Article.update_all ['position=?', index+1], ['id=?', id]
		end
		render :nothing => true
	end
end

