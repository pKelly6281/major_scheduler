class Major < ActiveRecord::Base
	has_many :users, through: :user_major
end
