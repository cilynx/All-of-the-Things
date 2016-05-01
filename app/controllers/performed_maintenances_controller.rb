class PerformedMaintenancesController < ApplicationController
  before_action :set_performed_maintenance, only: [:show, :edit, :update, :destroy]

  # GET /performed_maintenances
  # GET /performed_maintenances.json
  def index
    @performed_maintenances = PerformedMaintenance.all
  end

  # GET /performed_maintenances/1
  # GET /performed_maintenances/1.json
  def show
  end

  # GET /performed_maintenances/new
  def new
    @performed_maintenance = PerformedMaintenance.new
  end

  # GET /performed_maintenances/1/edit
  def edit
  end

  # POST /performed_maintenances
  # POST /performed_maintenances.json
  def create
    @performed_maintenance = PerformedMaintenance.new(performed_maintenance_params)

    respond_to do |format|
      if @performed_maintenance.save
        format.html { redirect_to @performed_maintenance, notice: 'Performed maintenance was successfully created.' }
        format.json { render :show, status: :created, location: @performed_maintenance }
      else
        format.html { render :new }
        format.json { render json: @performed_maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /performed_maintenances/1
  # PATCH/PUT /performed_maintenances/1.json
  def update
    respond_to do |format|
      if @performed_maintenance.update(performed_maintenance_params)
        format.html { redirect_to @performed_maintenance, notice: 'Performed maintenance was successfully updated.' }
        format.json { render :show, status: :ok, location: @performed_maintenance }
      else
        format.html { render :edit }
        format.json { render json: @performed_maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /performed_maintenances/1
  # DELETE /performed_maintenances/1.json
  def destroy
    @performed_maintenance.destroy
    respond_to do |format|
      format.html { redirect_to performed_maintenances_url, notice: 'Performed maintenance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_performed_maintenance
      @performed_maintenance = PerformedMaintenance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def performed_maintenance_params
      params.require(:performed_maintenance).permit(:maintenance_id, :service_id, :laborHours, :laborRate, performed_maintenance_parts_attributes: [:performed_maintenance_id, :part_id, :cost, :_destroy])
    end
end
