class Lego < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :name, presence: true
  validates :pieces, presence: true, numericality: { only_integer: true }
  validates :price, presence: true
  # validates :location, presence: true
end
