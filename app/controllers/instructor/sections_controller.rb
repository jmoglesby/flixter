class Instructor::SectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_section, only: [:update]
  before_action :set_course, only: [:create]
  before_action :require_authorized_for_course, only: [:create]
  before_action :require_authorized_for_section, only: [:update]

  def create
    @section = @course.sections.create(section_params)
    redirect_to instructor_course_path(@course)
  end

  def update
    @section.update_attributes(section_params)
    render plain: "updated!"
  end

  private #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  def require_authorized_for_course
    if @course.user != current_user
      return render plain: 'Unauthorized', status: :unauthorized
    end
  end

  def require_authorized_for_section
    if @section.course.user != current_user
      return render plain: 'Unauthorized', status: :unauthorized
    end
  end

  def set_course
    # memoize @course to reduce db calls from new->create
    @course ||= Course.find(params[:course_id])
  end

  def set_section
    @section ||= Section.find(params[:id])
  end

  def section_params
    params.require(:section).permit(:title, :row_order_position)
  end
  
end
