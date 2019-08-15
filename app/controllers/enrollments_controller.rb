class EnrollmentsController < ApplicationController
  before_action :authenticate_user!, :set_course
  
  def create
    current_user.enrollments.create(course: @course)

    redirect_to course_path(@course)
  end

  private #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  def set_course
    @course ||= Course.find(params[:course_id])
  end
end
