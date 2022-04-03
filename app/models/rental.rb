class Rental < ApplicationRecord
  has_many :favorite_stations, dependent: :destroy, inverse_of: :rental
  #reject_all_blank関数でtrueが出たパラメータは、送信データから除外させていく。
  accepts_nested_attributes_for :favorite_stations, allow_destroy: true, reject_if: :all_blank
end
