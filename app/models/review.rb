class Review < ApplicationRecord
  belongs_to :booking
  
  # validates :rating, presence: true, :inclusion { in: 0..5, message: "Should be between 0 and 5" }
  # validates :content, presence: true, length: { minimum: 150 }
end
