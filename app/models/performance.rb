class Performance < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  
  validates :title, presence: true
  validates :description, presence: true
  validates :hour_price, presence: true

  belongs_to :category
  belongs_to :profile
  has_many :booking

  # def distance
  #   stancedi = Geocoder::Calculations.distance_between([self.profile.latitude, self.profile.longitude], [current_user.profile.latitude, current_user.profile.longitude])
  #   stancedi.round(1)
  # end 
end


