class Lesson < ApplicationRecord
  belongs_to :section
  validates :title, presence: true
  mount_uploader :video, VideoUploader

  include RankedModel
  ranks :row_order, with_same: :section_id

  def next_lesson
    next_lesson = section.lessons.where("row_order > ?", self.row_order).rank(:row_order).first
    if next_lesson.blank? && section.next_section.present?
      return section.next_section.lessons.rank(:row_order).first
    end
    return next_lesson
  end
end
