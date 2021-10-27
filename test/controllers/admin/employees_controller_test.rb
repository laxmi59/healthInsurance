require 'test_helper'

class Admin::EmployeesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_employees_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_employees_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_employees_edit_url
    assert_response :success
  end

  test "should get delete" do
    get admin_employees_delete_url
    assert_response :success
  end

end
