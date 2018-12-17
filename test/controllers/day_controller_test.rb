require 'test_helper'

class DayControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get day_new_url
    assert_response :success
  end

  test "should get create" do
    get day_create_url
    assert_response :success
  end

  test "should get edit" do
    get day_edit_url
    assert_response :success
  end

  test "should get update" do
    get day_update_url
    assert_response :success
  end

  test "should get destroy" do
    get day_destroy_url
    assert_response :success
  end

  test "should get index" do
    get day_index_url
    assert_response :success
  end

  test "should get show" do
    get day_show_url
    assert_response :success
  end

end
