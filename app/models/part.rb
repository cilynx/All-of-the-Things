class Part < ActiveRecord::Base
   has_many :performed_maintenance_parts
   has_many :performed_maintenances, through: :performance_maintenance_parts

   def to_s
     return self.description
   end
end
