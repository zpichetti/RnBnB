class Booking < ApplicationRecord
  validates :status, presence: true, inclusion: { in:
  ["on demand",
  "refused", "waiting for payment", "payed",
  "performed", 
  "cancelled for non payment", 
  "cancelled by user", 
  "cancelled by performer"] }
  
  validates :start, presence: true
  validates :end, presence: true
  
  belongs_to :profile
  belongs_to :performance
end
