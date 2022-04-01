class RentalsController < ApplicationController
  before_action :set_rental, only: %i[ show edit update destroy ]

  # GET /rentals or /rentals.json
  def index
    @rentals = Rental.all
  end

  # GET /rentals/1 or /rentals/1.json
  def show
    @favorite_station = @rental.favorite_stations
  end

  # GET /rentals/new
  def new
    @rental = Rental.new
    2.tiems { @rental.favorite_stations.build }
  end

  # GET /rentals/1/edit
  def edit
    @rental.favorite_stations.build
  end

  # POST /rentals or /rentals.json
  def create
    @rental = Rental.new(rental_params)
    if @rental.save
      # 一覧画面へ遷移して"物件を登録しました！"とメッセージを表示する
      redirect_to rentals_path, notice: "物件を登録しました！"
    else
      # 入力フォームを再描写
      render :new
    end

    # SCAFFOLDで作成された部分
    # respond_to do |format|
    #   if @rental.save
    #     format.html { redirect_to rental_url(@rental), notice: "Rental was successfully created." }
    #     format.json { render :show, status: :created, location: @rental }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @rental.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /rentals/1 or /rentals/1.json
  def update
    if @rental.update(rental_params)
      redirect_to rentals_path, notice: "物件を編集しました"
      render :edit
    end
    # ↓SCAFFOLDで作成された部分
    # respond_to do |format|
    #   if @rental.update(rental_params)
    #     format.html { redirect_to rental_url(@rental), notice: "Rental was successfully updated." }
    #     format.json { render :show, status: :ok, location: @rental }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @rental.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /rentals/1 or /rentals/1.json
  def destroy
    @rental.destroy

    respond_to do |format|
      format.html { redirect_to rentals_url, notice: "Rental was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Only allow a list of trusted parameters through.
    def rental_params
      params.require(:rental).permit(:property,
                                     :rent,
                                     :addres,
                                     :building_age,
                                     :remark,
                                     favorite_stations_attributes: [
                                       :name_railway,
                                       :station_name,
                                       :how_minute,
                                       :id,
                                       :_destroy,
                                      ],
                                     )
    end
  def set_rental
    @rental = Rental.find(params[:id])
  end
end
