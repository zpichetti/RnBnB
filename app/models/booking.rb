class Booking < ApplicationRecord
  validates :status, presence: true
  belongs_to :profile
  belongs_to :performance
end
