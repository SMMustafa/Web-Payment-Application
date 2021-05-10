require 'test_helper'

class Ctrl1ControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get ctrl1_about_url
    assert_response :success
  end

  test "should get home" do
    get ctrl1_home_url
    assert_response :success
  end

  test "should get friends" do
    get ctrl1_friends_url
    assert_response :success
  end

  test "should get settings" do
    get ctrl1_settings_url
    assert_response :success
  end

end
