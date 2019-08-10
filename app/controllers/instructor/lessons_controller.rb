class Instructor::LessonsController < ApplicationController
  before_action :set_section, only: [:new, :create]
  
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

  def set_section
    @section = Section.find(params[:section_id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :subtitle)
  end
end
