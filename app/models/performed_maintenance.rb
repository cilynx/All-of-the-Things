class PerformedMaintenance < ActiveRecord::Base

  belongs_to :maintenance
  belongs_to :service

  has_one :vehicle, through: :service
  has_one :user, through: :vehicle

  has_many :performed_maintenance_parts
  has_many :parts, through: :performed_maintenance_parts

  accepts_nested_attributes_for :performed_maintenance_parts,
     :allow_destroy => true,
     :reject_if => :all_blank

  def to_s
    return self.maintenance.to_s
  end

end
