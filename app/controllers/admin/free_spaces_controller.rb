class Admin::FreeSpacesController < AdminController
  # GET /free_spaces
  # GET /free_spaces.xml
  def index
    @free_spaces = FreeSpace.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @free_spaces }
    end
  end

  # GET /free_spaces/1
  # GET /free_spaces/1.xml
  def show
    @free_space = FreeSpace.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @free_space }
    end
  end

  # GET /free_spaces/new
  # GET /free_spaces/new.xml
  def new
    @free_space = FreeSpace.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @free_space }
    end
  end

  # GET /free_spaces/1/edit
  def edit
    @free_space = FreeSpace.find(params[:id])
  end

  # POST /free_spaces
  # POST /free_spaces.xml
  def create
    @free_space = FreeSpace.new(params[:free_space])

    respond_to do |format|
      if @free_space.save
        format.html { redirect_to(@free_space, :notice => 'Free space was successfully created.') }
        format.xml  { render :xml => @free_space, :status => :created, :location => @free_space }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @free_space.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /free_spaces/1
  # PUT /free_spaces/1.xml
  def update
    @free_space = FreeSpace.find(params[:id])

    respond_to do |format|
      if @free_space.update_attributes(params[:free_space])
        format.html { redirect_to(@free_space, :notice => 'Free space was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @free_space.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /free_spaces/1
  # DELETE /free_spaces/1.xml
  def destroy
    @free_space = FreeSpace.find(params[:id])
    @free_space.destroy

    respond_to do |format|
      format.html { redirect_to(free_spaces_url) }
      format.xml  { head :ok }
    end
  end
end

