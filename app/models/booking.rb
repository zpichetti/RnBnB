class Booking < ApplicationRecord
  validates :status, presence: true
  belongs_to :profile, class_name: "UserProfile", foreign_key: "user_profile_id"
  belongs_to :performance
end
