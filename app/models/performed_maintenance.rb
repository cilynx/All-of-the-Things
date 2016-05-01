class PerformedMaintenance < ActiveRecord::Base

  belongs_to :maintenance
  belongs_to :service

  has_many :performed_maintenance_parts
  has_many :parts, through: :performed_maintenance_parts

  accepts_nested_attributes_for :performed_maintenance_parts,
     :allow_destroy => true,
     :reject_if => :all_blank

end
