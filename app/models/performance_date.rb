class PerformanceDate < ApplicationRecord
  validates :start, presence: true
  validates :end, presence: true
  belongs_to :performance_date
  has_many :bookings, throught: :performance_dates
end
