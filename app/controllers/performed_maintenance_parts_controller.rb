class PerformedMaintenancePartsController < ApplicationController
  before_action :set_performed_maintenance_part, only: [:show, :edit, :update, :destroy]

  # GET /performed_maintenance_parts
  # GET /performed_maintenance_parts.json
  def index
    @performed_maintenance_parts = PerformedMaintenancePart.all
  end

  # GET /performed_maintenance_parts/1
  # GET /performed_maintenance_parts/1.json
  def show
  end

  # GET /performed_maintenance_parts/new
  def new
    @performed_maintenance_part = PerformedMaintenancePart.new
  end

  # GET /performed_maintenance_parts/1/edit
  def edit
  end

  # POST /performed_maintenance_parts
  # POST /performed_maintenance_parts.json
  def create
    @performed_maintenance_part = PerformedMaintenancePart.new(performed_maintenance_part_params)

    respond_to do |format|
      if @performed_maintenance_part.save
        format.html { redirect_to @performed_maintenance_part, notice: 'Performed maintenance part was successfully created.' }
        format.json { render :show, status: :created, location: @performed_maintenance_part }
      else
        format.html { render :new }
        format.json { render json: @performed_maintenance_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /performed_maintenance_parts/1
  # PATCH/PUT /performed_maintenance_parts/1.json
  def update
    respond_to do |format|
      if @performed_maintenance_part.update(performed_maintenance_part_params)
        format.html { redirect_to @performed_maintenance_part, notice: 'Performed maintenance part was successfully updated.' }
        format.json { render :show, status: :ok, location: @performed_maintenance_part }
      else
        format.html { render :edit }
        format.json { render json: @performed_maintenance_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /performed_maintenance_parts/1
  # DELETE /performed_maintenance_parts/1.json
  def destroy
    @performed_maintenance_part.destroy
    respond_to do |format|
      format.html { redirect_to performed_maintenance_parts_url, notice: 'Performed maintenance part was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_performed_maintenance_part
      @performed_maintenance_part = PerformedMaintenancePart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def performed_maintenance_part_params
      params.require(:performed_maintenance_part).permit(:performed_maintenance_id, :part_id, :cost)
    end
end
