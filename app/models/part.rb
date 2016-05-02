class Part < ActiveRecord::Base
   has_many :performed_maintenance_parts
   has_many :performed_maintenances, through: :performance_maintenance_parts
end
