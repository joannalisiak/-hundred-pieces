class Lego < ApplicationRecord
  # belongs_to :user
  # has_many :bookings

  validates :name, presence: true
  validates :pieces, presence: true, numericality: { only_integer: true }
  validates :price, presence: true
  # validates :location, presence: true
end
