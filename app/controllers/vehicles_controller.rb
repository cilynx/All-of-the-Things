class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy, :image, :fillup, :import]

  # GET /vehicles
  # GET /vehicles.json
  def index
    @vehicles = current_user.vehicles
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
    #      @fillups = Kaminari.paginate_array(@vehicle.fillups.sort { |a,b| a.date <=> b.date }.reverse).page(params[:page]).per(10)
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
  end

  # GET /vehicles/1/edit
  def edit
  end

  # POST /accounts/1/import
  def import
    redirect_to :back, notice: Vehicle.import(params[:file], @vehicle.id)
  end

  # GET /vehicles/1/image
  def image
    send_data(@vehicle.image, :type => @vehicle.content_type, :disposition => 'inline')
  end

  # POST /vehicles/1/fillup
  def fillup
    fillup = Fillup.new(fillup_params)
    fillup.vehicle = @vehicle
    fillup.save
    redirect_to vehicle_path(@vehicle)
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user = current_user
    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to vehicles_path, notice: 'Vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: 'Vehicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_vehicle
    @vehicle = Vehicle.where("id = ? AND user_id = ?", params[:id], current_user.id).take
    redirect_to vehicles_url unless @vehicle;
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def vehicle_params
    params.require(:vehicle).permit(:vin, :user_id, :image_file, :canonical_vehicle_id)
  end

  def fillup_params
    params.require(:fillup).permit(:date, :odometer, :brand, :grade, :gallons, :ppg)
  end
end
