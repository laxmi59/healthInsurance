require 'test_helper'

class Admin::TopUpsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_top_ups_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_top_ups_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_top_ups_edit_url
    assert_response :success
  end

  test "should get show" do
    get admin_top_ups_show_url
    assert_response :success
  end

end
