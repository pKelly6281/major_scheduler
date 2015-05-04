class ChangeCourse < ActiveRecord::Migration
  def change
  	add_column :courses, :major, :integer
  end
end
