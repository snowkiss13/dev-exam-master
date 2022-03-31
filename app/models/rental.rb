class Rental < ApplicationRecord
  has_many :favorite_stations, dependent: :destroy
end
