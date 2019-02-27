class Performance < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :image_url, presence: true

  belongs_to :category
  belongs_to :performance_date
  belongs_to :profile
  has_many :booking
end
