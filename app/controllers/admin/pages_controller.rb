class Admin::PagesController < AdminController
	load_and_authorize_resource
	def index
		@pages = Page.all
	end

  def new
    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page }
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        flash[:notice] = 'Page was successfully created.'
        format.html { redirect_to @page }
        format.xml  { render :xml => @page, :status => :created, :location => admin_page_path(@page) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        flash[:notice] = 'Page was successfully updated.'
        format.html { redirect_to @page }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to admin_pages_path, :notice => 'Page deleted.'
  end

	def sort
		params[:page_list].each_with_index do |id, index|
			Page.update_all ['position=?', index+1], ['id=?', id]
		end
		render :nothing => true
	end
end

