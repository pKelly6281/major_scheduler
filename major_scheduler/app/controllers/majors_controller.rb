class MajorsController < ApplicationController
  def new
  	if logged_in?
  		@major = Major.new
  	else
  		redirect_to root_url
  	end
  end
  def create
  	@major = Major.new(major_params)
  	if @major.save
  		flash[:success] = "Major Created"
  		redirect_to root_url
  	else
  		render 'new'
  	end
  end
  private
  def major_params
  		params.require(:major).permit(:name)
  end
end
