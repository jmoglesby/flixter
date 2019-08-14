class Lesson < ApplicationRecord
  belongs_to :section
  validates :title, presence: true
  mount_uploader :video, VideoUploader
end
