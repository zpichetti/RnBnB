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

  def notification
    my_bookings = self.bookings.where(status: "waiting for payment").size
    bookings = Booking.joins("INNER JOIN performances ON performances.id = bookings.performance_id").where("bookings.status = 'on demand' AND performances.profile_id=?", self.id).size
    my_bookings + bookings
  end
end
