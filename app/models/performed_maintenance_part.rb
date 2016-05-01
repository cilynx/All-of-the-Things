class PerformedMaintenancePart < ActiveRecord::Base
  belongs_to :performed_maintenance
  belongs_to :part
end
