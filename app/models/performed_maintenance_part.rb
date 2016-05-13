class PerformedMaintenancePart < ActiveRecord::Base
  belongs_to :performed_maintenance
  has_one :service, through: :performed_maintenance
  has_one :vehicle, through: :service
  has_one :user, through: :vehicle
  has_one :canonical_vehicle, through: :vehicle

  belongs_to :part
end
