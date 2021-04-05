require "test_helper"

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
  end

  test "should get helo" do
    get homes_helo_url
    assert_response :success
  end

  test "should get about" do
    get homes_about_url
    assert_response :success
  end
end
