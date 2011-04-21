class Admin::ArticlesController < AdminController
	load_and_authorize_resource
	
  def index
		@articles = Article.all(:order => :position).paginate :page => params[:page], :per_page => 20

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
				@article.move_to_top # defined by acts_as_list
				move_to_top_in_section(@article) # 	NOT WORKING
        format.html { redirect_to @article }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @article = Article.find(params[:id])
		update_section_positions(@article.section) # important if the article's section changed
		
    respond_to do |format|
      if @article.update_attributes(params[:article])
				update_section_positions(@article.section) # important if the article's section changed
			
        flash[:notice] = 'Article was successfully updated.'
        format.html { redirect_to @article }
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

	def show_more
	
	end
	
	def sort # for articles in general
		params[:article_list].each_with_index do |id, index|
			Article.update_all ['position=?', index+1], ['id=?', id]
		end
		render :nothing => true
	end

	def sort_in_section # flaw here:
		# this params hash is based on the list of that PAGE
		# the top article of that PAGE has index 0
		params[:admin_section_article_list].each_with_index do |id, index|
			Article.update_all ['section_position=?', index+1], ['id=?', id]
		end
		render :nothing => true
  end

	private
		def move_to_top_in_section(article)
			articles = article.section.articles.all(:order => :section_position)
			articles.insert(0, articles.delete(article))
			articles.each_with_index do |art, index|
				Article.update_all ['section_position=?', index+1], ['id=?', art.id]
			end
		end

		def update_section_positions(section) # updates all section positions for articles in the given section
			# mainly for when there is a gap in section_positions, e.g. 1, 2, 4, 5 -> 1, 2, 3, 4
			articles = section.articles.all(:order => :section_position)
			articles.each_with_index do |art, index|
				Article.update_all ['section_position=?', index+1], ['id=?', art.id]
			end
		end
end

