require 'test_helper'

class UserlikesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get userlikes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get userlikes_destroy_url
    assert_response :success
  end

end
