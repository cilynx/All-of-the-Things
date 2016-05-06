class CanonicalVehicle < ActiveRecord::Base
   has_many :vehicles

   belongs_to :maintenance_schedule
   has_many :maintenances, through: :maintenance_schedule

   def to_s
      return self.year.to_s + ' ' + self.make + ' ' + self.model
   end

end
