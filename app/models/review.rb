class Review < ApplicationRecord
  belongs_to :booking
  validates :content, presence: true
  STARS = (0..5).to_a
  validates :rating, presence: true, numericality: true, inclusion: { in: STARS }
end
