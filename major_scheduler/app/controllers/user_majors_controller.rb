class UserMajorsController < ApplicationController
  def new
  	@user_major = UserMajor.new
  end

  def edit
  end
end
