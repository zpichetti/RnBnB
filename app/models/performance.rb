class Performance < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :image_url, presence: true

  belongs_to :category
  belongs_to :performance_date
  belongs_to :profile, class_name: "PerformerProfile", foreign_key: "performer_profile_id"
  has_many :booking
end
