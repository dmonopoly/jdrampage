class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [ :create ]
  before_filter :require_user, :only => :destroy

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_to admin_path
    else
      redirect_to '/', :notice => "Incorrect login."
    end
  end

  def destroy
    current_user_session.destroy
		flash[:notice] = "Logged out."
    redirect_to root_url
  end
end

