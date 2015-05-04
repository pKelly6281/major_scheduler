class TakenCoursesController < ApplicationController
  def new
  	@takencourse = TakenCourse.new
  	@courses = Course.all.map(){|e| [e.name, e.id]}
  end
  def create
  	@takencourse = TakenCourse.new(taken_course_params)
  	if @takencourse.save
  		flash[:success] = "Course Taken"
  		redirect_to root_url
  	else
  		render 'new'
  	end
  end
  	private
  	def taken_course_params
  		params.require(:taken_course).permit(:course_id,:user_id)
  	end
end
