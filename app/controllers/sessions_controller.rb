class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: (params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Login successful"
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "logout successful"
    redirect_to root_url
  end
end
