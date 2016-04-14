require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get requested_sign_up" do
    get :requested_sign_up
    assert_response :success
  end

end
