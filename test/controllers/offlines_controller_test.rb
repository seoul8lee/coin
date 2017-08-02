require 'test_helper'

class OfflinesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get career" do
    get :career
    assert_response :success
  end

  test "should get coding" do
    get :coding
    assert_response :success
  end

  test "should get career_new" do
    get :career_new
    assert_response :success
  end

  test "should get coding_new" do
    get :coding_new
    assert_response :success
  end

end
