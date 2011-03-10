class SubscribersController < ApplicationController
  def create
    @subscriber = Subscriber.find_or_create_by_email(params[:subscriber][:email])
    if @subscriber.save
      flash[:notice] = "Thank you for subscribing!"
      redirect_to '/'
    else
      flash[:notice] = "We're sorry - something went wrong.  Please try again."
      redirect_to new_subscriber_path # fix!!
    end
  end

  def new
    @subscriber = Subscriber.new
  end

end

