require 'test_helper'

class MainsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get intro" do
    get :intro
    assert_response :success
  end

end
