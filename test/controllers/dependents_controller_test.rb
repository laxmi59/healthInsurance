require 'test_helper'

class DependentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dependents_index_url
    assert_response :success
  end

  test "should get new" do
    get dependents_new_url
    assert_response :success
  end

  test "should get show" do
    get dependents_show_url
    assert_response :success
  end

  test "should get edit" do
    get dependents_edit_url
    assert_response :success
  end

end
