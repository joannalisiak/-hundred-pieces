class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :legos
  has_many :bookings
  has_many :received_bookings, through: :legos, source: :bookings


  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :email, presence: true, uniqueness: true, on: :create
  # validates :password, presence: true, confirmation: true, length: { minimum: 6 }

  # VALIDATION FANCY CODE DOES NOT WORK

  # validate :password_lower_case
  # validate :password_uppercase
  # validate :password_special_char
  # validate :password_contains_number

  # def password_uppercase
  #   return if !!password.match(/\p{Upper}/)
  #   errors.add :password, ' must contain at least 1 uppercase '
  # end

  # def password_lower_case
  #   return if !!password.match(/\p{Lower}/)
  #   errors.add :password, ' must contain at least 1 lowercase '
  # end

  # def password_special_char
  #   special = "?<>',?[]}{=-)(*&^%$#`~{}!"
  #   regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/
  #   return if password =~ regex
  #   errors.add :password, ' must contain at least 1 special character'
  # end

  # def password_contains_number
  #   return if password.count("0-9") > 0
  #   errors.add :password, ' must contain at least 1 number'
  # end
end


