require 'test_helper'

class RegisteredTeachersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get registered_teachers_index_url
    assert_response :success
  end

  test "should get register" do
    get registered_teachers_register_url
    assert_response :success
  end

  test "should get show" do
    get registered_teachers_show_url
    assert_response :success
  end

end
