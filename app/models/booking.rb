class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :lego
  has_many :reviews

  validates :start_date, presence: true
  validates :end_date, presence: true

  def transform_start_date
    @start_date = start_date
    @start_date.strftime("%B %d, %Y")
    @start_date.strftime("%B #{@start_date.day.ordinalize}, %Y")
  end

  def transform_end_date
    @end_date = end_date
    @end_date.strftime("%B %d, %Y")
    @end_date.strftime("%B #{@end_date.day.ordinalize}, %Y")
  end

  def day_of_rent
    (end_date - start_date).round
  end
end
