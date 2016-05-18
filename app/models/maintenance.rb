class Maintenance < ActiveRecord::Base
   has_many :steps
   accepts_nested_attributes_for :steps

   belongs_to :maintenance_schedule

   has_many :performed_maintenances
   has_many :performed_maintenance_parts, through: :performed_maintenences

   def to_s
      return self.item
   end

   def miles
     if self.replaceMiles && self.inspectMiles
       return [self.replaceMiles, self.inspectMiles].min
     end
     return self.replaceMiles if self.replaceMiles
     return self.inspectMiles if self.inspectMiles
   end

   def months
     if self.replaceMonths && self.inspectMonths
       return [self.replaceMonths, self.inspectMonths].min
     end
     return self.replaceMonths if self.replaceMonths
     return self.inspectMonths if self.inspectMonths
   end

   def latest_performed_maintenance(vehicle)
     return self.performed_maintenances.joins(:service).where(services: {vehicle_id: vehicle.id}).order("services.date DESC").first
   end

   def miles_until_due(vehicle)
     if self.latest_performed_maintenance(vehicle)
       return self.miles - (vehicle.current_odometer - self.latest_performed_maintenance(vehicle).service.odometer)
     else
       return self.miles - vehicle.current_odometer
     end
   end

   def months_until_due(vehicle)
     if latest_date(vehicle)
       return self.months - ((Date.today.year * 12 + Date.today.month) - (latest_date(vehicle).year * 12 + latest_date(vehicle).month)) if self.months
       return "N/A"
     end
   end

   def latest_date(vehicle)
     if self.latest_performed_maintenance(vehicle)
       return self.latest_performed_maintenance(vehicle).service.date
     end
   end

   def latest_odometer(vehicle)
     if self.latest_performed_maintenance(vehicle)
       return self.latest_performed_maintenance(vehicle).service.odometer
     end
   end

end
