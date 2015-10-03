require 'test_helper'

class IdeasControllerTest < ActionController::TestCase
  test "should get board" do
    get :board
    assert_response :success
  end

  test "should get detail" do
    get :detail
    assert_response :success
  end

end
