class FavoriteStation < ApplicationRecord
  belongs_to :rental, inverse_of: :favorite_stations
end
