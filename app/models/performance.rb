class Performance < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  
  validates :title, presence: true
  validates :description, presence: true
  validates :hour_price, presence: true

  belongs_to :category
  belongs_to :profile
  has_many :booking

  include PgSearch
  pg_search_scope :search_by_title_and_description,
    against: [ :title, :description ],
    using: {
      tsearch: { prefix: true } 
    }

  has_many :review

  def average_rating
    rate = self.review.average(:note)
    if rate
      return rate.round(2)
    else
      return "-"
    end
  end
end


