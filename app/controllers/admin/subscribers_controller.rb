class Admin::SubscribersController < AdminController
  def index
    @subscribers = Subscriber.all
  end

end

