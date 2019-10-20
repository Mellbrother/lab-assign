require 'test_helper'

class RegisteredStudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get registered_students_index_url
    assert_response :success
  end

  test "should get show" do
    get registered_students_show_url
    assert_response :success
  end

  test "should get register" do
    get registered_students_register_url
    assert_response :success
  end

end
