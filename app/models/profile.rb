class Profile < ApplicationRecord
  mount_uploader :avatar_url, PhotoUploader
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :address_zipcode, presence: true
  validates :address_city, presence: true
  validates :address_country, presence: true
  # voir pour affichage if il est performeur - validates :performer_description
  belongs_to :user, dependent: :destroy
  has_many :bookings
  has_many :performances
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
