class FavoriteStationsController < ApplicationController
  before_action :set_favorite_station, only: %i[ show edit update destroy ]

  # GET /favorite_stations or /favorite_stations.json
  def index
    @favorite_stations = FavoriteStation.all
  end

  # GET /favorite_stations/1 or /favorite_stations/1.json
  def show
  end

  # GET /favorite_stations/new
  def new
    @favorite_station = FavoriteStation.new
  end

  # GET /favorite_stations/1/edit
  def edit
  end

  # POST /favorite_stations or /favorite_stations.json
  def create
    @favorite_station = FavoriteStation.new(favorite_station_params)

    respond_to do |format|
      if @favorite_station.save
        format.html { redirect_to favorite_station_url(@favorite_station), notice: "Favorite station was successfully created." }
        format.json { render :show, status: :created, location: @favorite_station }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @favorite_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorite_stations/1 or /favorite_stations/1.json
  def update
    respond_to do |format|
      if @favorite_station.update(favorite_station_params)
        format.html { redirect_to favorite_station_url(@favorite_station), notice: "Favorite station was successfully updated." }
        format.json { render :show, status: :ok, location: @favorite_station }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @favorite_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorite_stations/1 or /favorite_stations/1.json
  def destroy
    @favorite_station.destroy

    respond_to do |format|
      format.html { redirect_to favorite_stations_url, notice: "Favorite station was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_station
      @favorite_station = FavoriteStation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favorite_station_params
      params.require(:favorite_station).permit(:name_railway, :station_name, :how_minute, :rental_id)
    end
end
