class Lego < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  # better has_many :bookings, dependent: :nullify
  # even better: add status column to each tables in db, active by default, when deleting toggling status to inactive
  has_one_attached :photo

  validates :name, presence: true
  validates :pieces, presence: true, numericality: { only_integer: true }
  validates :price, presence: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def already_booked?(user)
    self.bookings.any? do |booking|
      booking.user == user
    end
  end

  scope :filter_by_pieces, -> (min, max) { where('pieces > ? AND pieces < ?', min, max) }

  scope :filter_by_price, -> (min, max) { where('price > ? AND price < ?', min, max) }

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: {
      name: "A",
      description: "B"
    },
    using: {
      tsearch: { prefix: true }
    }

  pg_search_scope :search_by_location,
    against: [ :address ],
    using: {
      tsearch: { prefix: true }
    }

end
