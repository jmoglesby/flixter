class Section < ApplicationRecord
  belongs_to :course
  has_many :lessons
  attr_reader :number_of_lessons

  def number_of_lessons
    lessons.count
  end
end
