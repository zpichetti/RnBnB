class Profile < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :address_zipcode, presence: true
  validates :address_city, presence: true
  validates :address_country, presence: true
  validates :performer_description
  
  belongs_to :user, dependent: :destroy
end
