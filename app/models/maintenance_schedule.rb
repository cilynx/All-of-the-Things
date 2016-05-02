class MaintenanceSchedule < ActiveRecord::Base

   has_many :canonical_vehicles
   accepts_nested_attributes_for :canonical_vehicles
   
   has_many :maintenances
   accepts_nested_attributes_for :maintenances

   def self.import(file)
      ms = MaintenanceSchedule.new(JSON.parse(file.read))
      ms.save
   end

end
