class Airline < ApplicationRecord
  validates_presence_of :name

  has_many :flights
  # has_many :flight_passengers, through: :flights
  # has_many :flight_passengers, through: :passengers
end
