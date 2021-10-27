require 'test_helper'

class Admin::PoliciesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_policies_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_policies_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_policies_edit_url
    assert_response :success
  end

  test "should get show" do
    get admin_policies_show_url
    assert_response :success
  end

end
