class CanonicalVehicle < ActiveRecord::Base
   has_many :vehicles

   def to_s
      return self.year.to_s + ' ' + self.make + ' ' + self.model
   end

end
