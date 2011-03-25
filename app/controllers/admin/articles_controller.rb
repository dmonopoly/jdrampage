class Admin::ArticlesController < AdminController

  def index
    @articles = Article.all(:order => :position)

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
				move_to_top_in_section(@article)
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
		section = @article.section
    @article.destroy
		update_section_positions(section)
		flash[:notice] = 'Article was successfully deleted.'
    respond_to do |format|
      format.html { redirect_to(admin_articles_path) }
    end
  end

	def sort # for articles in general
		params[:article_list].each_with_index do |id, index|
			Article.update_all ['position=?', index+1], ['id=?', id]
		end
		render :nothing => true
	end

	def sort_in_section
		params[:admin_section_article_list].each_with_index do |id, index|
			Article.update_all ['section_position=?', index+1], ['id=?', id]
		end
		render :nothing => true
  end

	private
		def move_to_top_in_section(article)
			articles = article.section.articles.all
			articles.unshift(articles.pop) # makes last become first; like articles.rotate!(-1)
			articles.each_with_index do |art, index|
				Article.update_all ['section_position=?', index+1], ['id=?', art.id]
			end
		end

		def update_section_positions(section) # updates all section positions for articles in the given section
			articles = section.articles.all
			articles.each_with_index do |art, index|
				Article.update_all ['section_position=?', index+1], ['id=?', art.id]
			end
		end
end

