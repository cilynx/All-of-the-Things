class CanonicalVehiclesController < ApplicationController
  before_action :set_canonical_vehicle, only: [:show, :edit, :update, :destroy]

  # GET /canonical_vehicles
  # GET /canonical_vehicles.json
  def index
    @canonical_vehicles = CanonicalVehicle.all
  end

  # GET /canonical_vehicles/1
  # GET /canonical_vehicles/1.json
  def show
  end

  # GET /canonical_vehicles/new
  def new
    @canonical_vehicle = CanonicalVehicle.new
  end

  # GET /canonical_vehicles/1/edit
  def edit
  end

  # POST /canonical_vehicles
  # POST /canonical_vehicles.json
  def create
    @canonical_vehicle = CanonicalVehicle.new(canonical_vehicle_params)

    respond_to do |format|
      if @canonical_vehicle.save
        format.html { redirect_to @canonical_vehicle, notice: 'Canonical vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @canonical_vehicle }
      else
        format.html { render :new }
        format.json { render json: @canonical_vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /canonical_vehicles/1
  # PATCH/PUT /canonical_vehicles/1.json
  def update
    respond_to do |format|
      if @canonical_vehicle.update(canonical_vehicle_params)
        format.html { redirect_to @canonical_vehicle, notice: 'Canonical vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @canonical_vehicle }
      else
        format.html { render :edit }
        format.json { render json: @canonical_vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /canonical_vehicles/1
  # DELETE /canonical_vehicles/1.json
  def destroy
    @canonical_vehicle.destroy
    respond_to do |format|
      format.html { redirect_to canonical_vehicles_url, notice: 'Canonical vehicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_canonical_vehicle
      @canonical_vehicle = CanonicalVehicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def canonical_vehicle_params
      params.require(:canonical_vehicle).permit(:make, :model, :year)
    end
end
