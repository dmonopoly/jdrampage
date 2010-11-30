class SubscribersController < AdminController
  def create
    @subscriber = Subscriber.find_or_create_by_email(params[:subscriber][:email])
    if @subscriber.save
      flash[:notice] = "Successfully added to the email list!"
      redirect_to thank_you_subscribers_path
    else
      render :action => "new"
    end
  end
  
  def new
    @subscriber = Subscriber.new
  end
  
  def thank_you
  end
end
