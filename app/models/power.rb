class Power

  include Consul::Power

  def initialize(user)
    @user = user
  end

  # Anyone can view CanonicalVehicles
  power :canonical_vehicles do
    CanonicalVehicle.all
  end

  # Only admins can update or destroy CanonicalVehicles
  power :destroyable_canonical_vehicles, :updatable_canonical_vehicles do
    CanonicalVehicle if @user.in_named_group?(:admin)
  end

  # Users can only see their own Fillups
  power :fillups do
    @user.fillups
  end

  # Users can only see their own Houses
  power :houses do
    @user.houses
  end

  # Anyone can view Maintenances
  power :maintenances do
    Maintenance.all
  end

  # Only admins can update or destroy Maintenances
  power :destroyable_maintenances, :updatable_maintenances do
    Maintenance if @user.in_named_group?(:admin)
  end

  # Anyone can view MaintenanceSchedules
  power :maintenance_schedules do
    MaintenanceSchedule.all
  end

  # Only admins can update or destroy MaintenanceSchedules
  power :destroyable_maintenance_schedules, :updatable_maintenance_schedules do
    MaintenanceSchedule if @user.in_named_group?(:admin)
  end

  # Anyone can view Parts
  power :parts do
    Part.all
  end

  # Only admins can update or destroy Parts
  power :destroyable_parts, :updatable_parts do
    Part if @user.in_named_group?(:admin)
  end

  # Users can only see their own PerformedMaintenances
  power :performed_maintenances do
    @user.performed_maintenances
  end

  # Users can only see their own PerformedMaintenanceParts
  power :performed_maintenance_parts do
    @user.performed_maintenance_parts
  end

  # Users can only see their own Services
  power :services do
    @user.services
  end

  # Anyone can view Steps
  power :steps do
    Step.all
  end

  # Only admins can update or destroy Steps
  power :destroyable_steps, :updatable_steps do
    Step if @user.in_named_group?(:admin)
  end

  # Users can only see their own Vehicles
  power :vehicles do
    @user.vehicles
  end

end
