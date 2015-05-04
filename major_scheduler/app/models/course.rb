class Course < ActiveRecord::Base
	belongs_to :majors
	has_many :users, through: :taken_courses
end
