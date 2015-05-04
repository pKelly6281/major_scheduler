class CoursesController < ApplicationController
	def new
		@course = Course.new
		@majors = Major.all.map(){|e| [e.name, e.id]}
	end
	def create
		@course = Course.new(course_params)
		if @course.save
			flash[:success] = "Course Added"
			redirect_to root_url
		else
			flash[:danger] = "Course could not be added"
			redirect_to root_url
		end
	end
	private
	def course_params
		params.require(:course).permit(:name, :major)
	end
end
