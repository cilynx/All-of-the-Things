class Fillup < ActiveRecord::Base
   belongs_to :vehicle, inverse_of: :fillups
end
