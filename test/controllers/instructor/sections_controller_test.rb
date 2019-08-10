require 'test_helper'

class Instructor::SectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index," do
    get instructor_sections_index,_url
    assert_response :success
  end

  test "should get new," do
    get instructor_sections_new,_url
    assert_response :success
  end

  test "should get create," do
    get instructor_sections_create,_url
    assert_response :success
  end

  test "should get show" do
    get instructor_sections_show_url
    assert_response :success
  end

end
