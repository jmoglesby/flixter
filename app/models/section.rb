class Section < ApplicationRecord
  belongs_to :course
  has_many :lessons
  attr_reader :number_of_lessons

  include RankedModel
  ranks :row_order, with_same: :course_id

  def number_of_lessons
    lessons.count
  end
end
