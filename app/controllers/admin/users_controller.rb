class Admin::UsersController < AdminController
  def index
    @users = User.order(:email).page(params[:page])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end
end
