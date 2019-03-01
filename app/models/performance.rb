class Performance < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  
  validates :title, presence: true
  validates :description, presence: true
  validates :hour_price, presence: true

  belongs_to :category
  belongs_to :profile
  has_many :booking
  has_many :review
end
