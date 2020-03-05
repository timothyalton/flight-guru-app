class User < ApplicationRecord
  has_many :bookings
  has_many :flights, through: :bookings
  has_many :terminals, through: :flights # check if this works? 
  has_many :restaurants, through: :terminals
  has_secure_password

  validates :username, uniqueness: true
  validates :name, :username, presence: true
  validates :username, :password, format: { without: /\s/, message: "cannot have spaces" }
  # validates :username, :password, format: { with: /\A[a-zA-Z0-9]+\Z/ }

  
end
