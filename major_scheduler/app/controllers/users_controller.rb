class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @userMajor = UserMajor.where('user_id='+@user.id.to_s).exists?
    if current_user.id != @user.id
        flash[:danger] = "You cannot access their page"
        redirect_to root_url
    end
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
    @user = User.find(params[:id])
    @majors = Major.all
  end

  def update
  end
  def your_schedule
    @user = current_user
    @userMajor = UserMajor.where('user_id ='+@user.id.to_s)
    @courses = Course.where('major ='+@userMajor.first.major_id.to_s)
    @courses_options = Array.new
    @courses.each do |e|
      if !TakenCourse.where('course_id ='+e.id.to_s).exists?
        @courses_options.push(e)
      end
    end
    
    @coursesTaken = TakenCourse.where('user_id='+@user.id.to_s)
    @courseTaken_options = Array.new
    @coursesTaken.each do |e|
        @course = Course.find(e['course_id'])
        @temp = Array.new
        @temp.push(@course.name, @course.id)
        @courseTaken_options.push(@temp)
    end

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