class SubscribersController < ApplicationController
  def create
    @subscriber = Subscriber.find_or_create_by_email(params[:subscriber][:email])
    if @subscriber.save
      flash[:notice] = "Thank you for subscribing!"
      redirect_to '/'
    else
      render :action => "new"
    end
  end

  def new
    @subscriber = Subscriber.new
  end

end

