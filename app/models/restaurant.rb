class Restaurant < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :city

  validates :name, presence: true
  validates :photo, presence: true
end
