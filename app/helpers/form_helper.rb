module FormHelper
   def setup_performed_maintenance(performed_maintenance)
      3.times { performed_maintenance.performed_maintenance_parts.build }
      performed_maintenance
   end
end
