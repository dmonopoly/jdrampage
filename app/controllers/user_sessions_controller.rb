class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_to backside_path
    else
      redirect_to '/', :notice => "Incorrect login."
    end
  end

  def destroy
    current_user_session.destroy
    redirect_back_or_default root_url
  end
end
