class Admin::SectionsController < AdminController
	load_and_authorize_resource
	
	def index
		@sections = Section.all
	end

  def show
    @section = Section.find(params[:id])
		@articles = @section.articles.paginate :page => params[:page], :per_page => 20, :order => 'articles.section_position ASC'
  end
	
	# Section names should not be altered. Doing so will cause issues with free spaces.
  def edit
  	@section = Section.find(params[:id])
  end

  def update
  	@section = Section.find(params[:id])

    respond_to do |format|
      if @section.update_attributes(params[:section])
        flash[:notice] = 'Section was successfully updated.'
        format.html { redirect_to(admin_section_path(@section)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @section.errors, :status => :unprocessable_entity }
      end
    end
  end

	def sort
		params[:section_list].each_with_index do |id, index|
			Section.update_all ['position=?', index+1], ['id=?', id]
		end
		render :nothing => true
	end

end