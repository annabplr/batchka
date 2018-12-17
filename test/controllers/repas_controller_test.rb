require 'test_helper'

class RepasControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get repas_new_url
    assert_response :success
  end

  test "should get create" do
    get repas_create_url
    assert_response :success
  end

  test "should get edit" do
    get repas_edit_url
    assert_response :success
  end

  test "should get update" do
    get repas_update_url
    assert_response :success
  end

  test "should get destroy" do
    get repas_destroy_url
    assert_response :success
  end

  test "should get index" do
    get repas_index_url
    assert_response :success
  end

  test "should get show" do
    get repas_show_url
    assert_response :success
  end

end
