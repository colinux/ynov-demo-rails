class Restaurant < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :city
  belongs_to :user

  validates :name, presence: true
  validates :photo, presence: true
  validates :user, presence: true
end
