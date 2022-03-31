require "application_system_test_case"

class FavoriteStationsTest < ApplicationSystemTestCase
  setup do
    @favorite_station = favorite_stations(:one)
  end

  test "visiting the index" do
    visit favorite_stations_url
    assert_selector "h1", text: "Favorite Stations"
  end

  test "creating a Favorite station" do
    visit favorite_stations_url
    click_on "New Favorite Station"

    fill_in "How minute", with: @favorite_station.how_minute
    fill_in "Name railway", with: @favorite_station.name_railway
    fill_in "Rental", with: @favorite_station.rental_id
    fill_in "Station name", with: @favorite_station.station_name
    click_on "Create Favorite station"

    assert_text "Favorite station was successfully created"
    click_on "Back"
  end

  test "updating a Favorite station" do
    visit favorite_stations_url
    click_on "Edit", match: :first

    fill_in "How minute", with: @favorite_station.how_minute
    fill_in "Name railway", with: @favorite_station.name_railway
    fill_in "Rental", with: @favorite_station.rental_id
    fill_in "Station name", with: @favorite_station.station_name
    click_on "Update Favorite station"

    assert_text "Favorite station was successfully updated"
    click_on "Back"
  end

  test "destroying a Favorite station" do
    visit favorite_stations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Favorite station was successfully destroyed"
  end
end
