require 'test_helper'

class Instructor::LessonsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get instructor_lessons_new_url
    assert_response :success
  end

  test "should get create" do
    get instructor_lessons_create_url
    assert_response :success
  end

end
