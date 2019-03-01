class Performance < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  
  validates :title, presence: true
  validates :description, presence: true
  validates :hour_price, presence: true

  belongs_to :category
  belongs_to :profile
  has_many :booking
  has_many :review


  # def distance
  #   stancedi = Geocoder::Calculations.distance_between([self.profile.latitude, self.profile.longitude], [current_user.profile.latitude, current_user.profile.longitude])
  #   stancedi.round(1)
  # end 
  def average_rating
    rate = self.review.average(:note)
    if rate
      return rate.round(2)
    else
      return "-"
    end
  end
end


