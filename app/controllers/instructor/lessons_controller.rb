class Instructor::LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lesson, only: [:update]
  before_action :set_section, only: [:create]
  before_action :require_authorized_for_section, only: [:create]
  before_action :require_authorized_for_lesson, only: [:update]

  def create
    @lesson = @section.lessons.create(lesson_params)

    if @lesson.valid?
      redirect_to instructor_course_path(@section.course)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @lesson.update_attributes(lesson_params)
    render plain: 'updated!'
  end

  private #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  def require_authorized_for_section
    if @section.course.user != current_user
      return render plain: 'Unauthorized', status: :unauthorized
    end
  end

  def require_authorized_for_lesson
    if @lesson.section.course.user != current_user
      return render plain: 'Unauthorized', status: :unauthorized
    end
  end
  
  def set_section
    # memoize @section to reduce calls to db from new->create
    @section ||= Section.find(params[:section_id])
  end

  def set_lesson
    @lesson ||= Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :subtitle, :video, :row_order_position)
  end
end
