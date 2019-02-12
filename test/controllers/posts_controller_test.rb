require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get posts_index_url
    assert_response :success
  end

  test "should get ahow" do
    get posts_ahow_url
    assert_response :success
  end

end
