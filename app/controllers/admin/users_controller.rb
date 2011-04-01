class Admin::UsersController < AdminController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully made user account."
      redirect_to admin_users_path
    else
      render :action => "new"
    end
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated."
      redirect_to admin_users_path
    else
      render :action => :edit
    end
  end

  def destroy
    #@user = @current_user
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end
end