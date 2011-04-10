class Admin::SubscribersController < AdminController
  load_and_authorize_resource
	def index
    @subscribers = Subscriber.all
  end

  def edit
    @subscriber = Subscriber.find(params[:id])
  end

  def update
    @subscriber = Subscriber.find(params[:id])

    respond_to do |format|
      if @subscriber.update_attributes(params[:subscriber])
        flash[:notice] = 'Subscriber was successfully updated.'
        format.html { redirect_to admin_subscribers_path }
        format.xml { head :ok }
      else
        format.html { render :action => 'edit' }
        format.xml { render :xml => @subscriber.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @subscriber = Subscriber.find(params[:id])
    email = @subscriber.email
    @subscriber.destroy

    respond_to do |format|
      flash[:notice] = "Subscriber #{email} was successfully deleted."
      format.html { redirect_to(admin_subscribers_path) }
      format.xml  { head :ok }
    end
  end
end

