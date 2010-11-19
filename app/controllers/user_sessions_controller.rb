class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  def new
    if User.none?
      flash[:notice] = "Create the first account"
      redirect_to new_admin_account_path
    else
      @user_session = UserSession.new
    end
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_to control_panel_path
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    #flash[:notice] = "Logout successful!"
    redirect_back_or_default root_url
  end
end
