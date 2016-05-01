class Maintenance < ActiveRecord::Base
   has_many :steps
   accepts_nested_attributes_for :steps

   has_many :performed_maintenences
   has_many :performed_maintenance_parts, through: :performed_maintenences

   def to_s
      return self.item
   end

end
