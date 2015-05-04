class User < ActiveRecord::Base
attr_accessor :remember_token
  before_save { self.email = email.downcase }#runs before we execute code before
  has_many :majors, through: :user_major
  has_many :courses, through: :taken_courses
	#first name and last name validation 
	validates :firstname, presence: true, length: { maximum: 30}
	validates :lastname, presence: true, length: { maximum: 30}


	#email validation 
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 150 },
                    format: { with: /\A([^@\s]+)@((mcla+\.)+edu)\z/i , :message =>"must be a mcla.edu address"},
                    uniqueness: { case_sensitive: false }



    has_secure_password
	validates :password, length: { minimum: 6 } 	#should be password not password_confirmation 

	#has secure password links us to the password object on this line
	#creating user password confirmation. Most of our code for making secure passwords comes from the rails method below
	def authenticated?(attribute, token)
  		digest = send("#{attribute}_digest")
    	return false if digest.nil?
    	BCrypt::Password.new(digest).is_password?(token)
  end
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  end
  
end
