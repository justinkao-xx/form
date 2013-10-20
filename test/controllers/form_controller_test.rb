require 'test_helper'

class FormControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get converter" do
    get :converter
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

end
