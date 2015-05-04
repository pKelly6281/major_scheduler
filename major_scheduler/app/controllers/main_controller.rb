class MainController < ApplicationController
  def home
  	@majors = Major.all
  end

  def about
  end

  def contact_us
  end
end
