require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get auth_user" do
    get users_auth_user_url
    assert_response :success
  end

  test "should get auth_user_callback" do
    get users_auth_user_callback_url
    assert_response :success
  end

end
