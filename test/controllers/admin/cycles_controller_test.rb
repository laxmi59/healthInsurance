require 'test_helper'

class Admin::CyclesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_cycles_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_cycles_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_cycles_edit_url
    assert_response :success
  end

  test "should get delete" do
    get admin_cycles_delete_url
    assert_response :success
  end

end
