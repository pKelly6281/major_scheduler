class UserMajorsController < ApplicationController
  def new
  	@usermajor = UserMajor.new
  	@majors = Major.all.map(){|e| [e.name, e.id]}
  	@user = current_user
  end
  def create
  	@usermajor = UserMajor.new(user_majors_params)
  	if @usermajor.save
  		flash[:success] = "Added Major"
  		redirect_to root_url
  	else
  		flash[:danger] = "Adding a club failed"
  		redirect_to root_url
  	end
  end

  def edit
  	redirect_to root_url
  	@user_major = UserMajor.where('user_id= '+params[:id].to_s)
  	@majors = Major.all.map(){|e| [e.name, e.id]}
  	@user = current_user
  end
  private
  def user_majors_params
  	params.require(:user_major).permit(:user_id, :major_id)
  
  end 
end
