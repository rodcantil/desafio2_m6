require "test_helper"

class NoticesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @notice = notices(:one)
  end

  test "should get index" do
    get notices_url
    assert_response :success
  end

  test "should get new" do
    sign_in users(:one)
    get new_notice_url
    assert_response :success
  end

  test "should create notice" do
    assert_difference("Notice.count") do
      post notices_url, params: { notice: { description: @notice.description, image: @notice.image, title: @notice.title, user_id: @notice.user_id } }
    end

    assert_redirected_to notice_url(Notice.last)
  end

  test "should show notice" do
    get notice_url(@notice)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get edit_notice_url(@notice)
    assert_response :success
  end

  test "should update notice" do
    sign_in users(:one)
    patch notice_url(@notice), params: { notice: { description: @notice.description, image: @notice.image, title: @notice.title, user_id: @notice.user_id } }
    assert_redirected_to notice_url(@notice)
  end

  test "should destroy notice" do
    sign_in users(:one)
    assert_difference("Notice.count", -1) do
      delete notice_url(@notice)
    end

    assert_redirected_to notices_url
  end
end
