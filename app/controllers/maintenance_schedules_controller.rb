class MaintenanceSchedulesController < ApplicationController
  power :crud => :maintenance_schedules
  before_action :set_maintenance_schedule, only: [:show, :edit, :update, :destroy]

  # GET /maintenance_schedules
  # GET /maintenance_schedules.json
  def index
    @maintenance_schedules = current_power.maintenance_schedules
  end

  # GET /maintenance_schedules/1
  # GET /maintenance_schedules/1.json
  def show
  end

  # GET /maintenance_schedules/new
  def new
    @maintenance_schedule = MaintenanceSchedule.new
  end

  # GET /maintenance_schedules/1/edit
  def edit
  end

  # POST /maintenance_schedules/import
  def import
     redirect_to :back, notice: MaintenanceSchedule.import(params[:file])
  end

  # POST /maintenance_schedules
  # POST /maintenance_schedules.json
  def create
    @maintenance_schedule = MaintenanceSchedule.new(maintenance_schedule_params)

    respond_to do |format|
      if @maintenance_schedule.save
        format.html { redirect_to @maintenance_schedule, notice: 'Maintenance schedule was successfully created.' }
        format.json { render :show, status: :created, location: @maintenance_schedule }
      else
        format.html { render :new }
        format.json { render json: @maintenance_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenance_schedules/1
  # PATCH/PUT /maintenance_schedules/1.json
  def update
    respond_to do |format|
      if @maintenance_schedule.update(maintenance_schedule_params)
        format.html { redirect_to @maintenance_schedule, notice: 'Maintenance schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @maintenance_schedule }
      else
        format.html { render :edit }
        format.json { render json: @maintenance_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance_schedules/1
  # DELETE /maintenance_schedules/1.json
  def destroy
    @maintenance_schedule.destroy
    respond_to do |format|
      format.html { redirect_to maintenance_schedules_url, notice: 'Maintenance schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_schedule
      @maintenance_schedule = current_power.maintenance_schedules.find_by(:id => params[:id])
      redirect_to maintenance_schedule_url unless @maintenance_schedule
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maintenance_schedule_params
      params.fetch(:maintenance_schedule, {})
    end
end
