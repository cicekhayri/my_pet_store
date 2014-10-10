class UsersController < ApplicationController
  before_filter :authorize, only: [:index]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    if current_user
      @user = current_user
    else
      redirect_to root_url
    end
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      flash[:notice] = "User created successful"
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :back
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
