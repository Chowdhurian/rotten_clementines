class Admin::UsersController < AdminController
  def index
    @users = User.order(:email).page(params[:page])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(users_params)
      redirect_to admin_users_path(@user), notice: "#{@user.email} was edited successfully!"
    else
      render :edit
    end
  end

  protected

  def users_params
    params.require(:user).permit(
      :email, :firstname, :lastname, :admin
    )
  end
end
