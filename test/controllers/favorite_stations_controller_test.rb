require 'test_helper'

class FavoriteStationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favorite_station = favorite_stations(:one)
  end

  test "should get index" do
    get favorite_stations_url
    assert_response :success
  end

  test "should get new" do
    get new_favorite_station_url
    assert_response :success
  end

  test "should create favorite_station" do
    assert_difference('FavoriteStation.count') do
      post favorite_stations_url, params: { favorite_station: { how_minute: @favorite_station.how_minute, name_railway: @favorite_station.name_railway, rental_id: @favorite_station.rental_id, station_name: @favorite_station.station_name } }
    end

    assert_redirected_to favorite_station_url(FavoriteStation.last)
  end

  test "should show favorite_station" do
    get favorite_station_url(@favorite_station)
    assert_response :success
  end

  test "should get edit" do
    get edit_favorite_station_url(@favorite_station)
    assert_response :success
  end

  test "should update favorite_station" do
    patch favorite_station_url(@favorite_station), params: { favorite_station: { how_minute: @favorite_station.how_minute, name_railway: @favorite_station.name_railway, rental_id: @favorite_station.rental_id, station_name: @favorite_station.station_name } }
    assert_redirected_to favorite_station_url(@favorite_station)
  end

  test "should destroy favorite_station" do
    assert_difference('FavoriteStation.count', -1) do
      delete favorite_station_url(@favorite_station)
    end

    assert_redirected_to favorite_stations_url
  end
end
