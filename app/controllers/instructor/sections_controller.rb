class Instructor::SectionsController < ApplicationController
  def index
  end

  def new
    @course = Course.find(params[:course_id])
    @section = Section.new
  end

  def create
    @course = Course.find(params[:course_id])
    @section = @course.sections.create(section_params)

    redirect_to instructor_course_path(@course)
  end

  def show
  end

  private #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  def section_params
    params.require(:section).permit(:title)
  end
end
