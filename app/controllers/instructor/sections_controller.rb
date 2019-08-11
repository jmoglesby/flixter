class Instructor::SectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, only: [:new, :create]
  before_action :require_authorized_for_course

  def index
  end

  def new
    @section = Section.new
  end

  def create
    @section = @course.sections.create(section_params)

    redirect_to instructor_course_path(@course)
  end

  def show
  end

  private #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  def set_course
    # memoize @course to reduce db calls from new->create
    @course ||= Course.find(params[:course_id])
  end

  def require_authorized_for_course
    if @course.user != current_user
      return render plain: 'Unauthorized', status: :unauthorized
    end
  end

  def section_params
    params.require(:section).permit(:title)
  end
  
end
