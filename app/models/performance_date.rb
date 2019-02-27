class PerformanceDate < ApplicationRecord
  validates :start, presence: true
  validates :end, presence: true
  belongs_to :performance_date
end
