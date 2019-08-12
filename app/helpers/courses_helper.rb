module CoursesHelper

  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
