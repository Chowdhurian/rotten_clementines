class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to materials_path, notice: "Welcome back, #{user.email}!"
    else
      flash.now[:alert] = "hmm, log in failed...typo?"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to materials_path, notice: "see you later!"
  end
end
