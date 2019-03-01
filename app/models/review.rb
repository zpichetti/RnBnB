class Review < ApplicationRecord
  belongs_to :performance
  belongs_to :profile
  validates :note, presence: true
  validates :content, presence: true
end
