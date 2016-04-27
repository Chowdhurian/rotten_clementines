class Admin::UsersController < AdminController
  def index
    @users = User.order(:email).page params[:page]
  end
end
