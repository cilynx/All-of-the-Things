class Maintenance < ActiveRecord::Base
   has_many :steps
   accepts_nested_attributes_for :steps

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

end
