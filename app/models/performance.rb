class Performance < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :image_url, presence: true

  belongs_to :category
  belongs_to :profile
  has_many :booking
  has_many :performance_dates
end
