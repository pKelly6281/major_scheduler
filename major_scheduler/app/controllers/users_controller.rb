class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    redirect_to root_url
  end

  def index
    redirect_to root_url
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    redirect_to root_url
  end

  def update
  end
  def your_schedule
  end
  private
    def user_params
      params.require(:user).permit(:firstname,:lastname, :email, :password, :password_confirmation)
    end
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end