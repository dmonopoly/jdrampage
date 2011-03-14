class Admin::FreeSpacesController < AdminController

  def index
    @free_spaces = FreeSpace.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @free_space = FreeSpace.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @free_space = FreeSpace.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @free_space = FreeSpace.find(params[:id])
  end

  def create
    @free_space = FreeSpace.new(params[:free_space])

    respond_to do |format|
      if @free_space.save
        format.html { redirect_to(admin_free_space_path(@free_space), :notice => 'Free space was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @free_space = FreeSpace.find(params[:id])

    respond_to do |format|
      if @free_space.update_attributes(params[:free_space])
        format.html { redirect_to(admin_free_space_path(@free_space), :notice => 'Free space was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @free_space = FreeSpace.find(params[:id])
    @free_space.destroy

    respond_to do |format|
      format.html { redirect_to(admin_free_spaces_url) }
    end
  end
end

