class Instructor::LessonsController < ApplicationController
  # before_action :authenticate_user!
  before_action :authenticate_user!
  before_action :set_section, only: [:new, :create]
  before_action :require_authorized_for_section
  
  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = @section.lessons.create(lesson_params)

    if @lesson.valid?
      redirect_to instructor_course_path(@section.course)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  def require_authorized_for_section
    if @section.course.user != current_user
      return render plain: 'Unauthorized', status: :unauthorized
    end
  end
  
  def set_section
    # memoize @section to reduce calls to db from new->create
    @section ||= Section.find(params[:section_id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :subtitle)
  end
end
