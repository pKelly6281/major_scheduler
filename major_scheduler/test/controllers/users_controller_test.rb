require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get your_schedule" do
    get :your_schedule
    assert_response :success
  end

end
