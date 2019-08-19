class LessonsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  before_action :ensure_user_is_enrolled, only: [:show]

  # GET /lessons
  # GET /lessons.json
  def index
    @lessons = Lesson.all
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
  end

  private #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      # memoize @lesson to reduce database between new->create
      @lesson ||= Lesson.find(params[:id])
    end

    def ensure_user_is_enrolled
      unless current_user.enrolled_in?(@lesson.section.course)
        redirect_to course_path(@lesson.section.course), alert: "You must enroll in a course to view the lessons."
      end
    end
end
