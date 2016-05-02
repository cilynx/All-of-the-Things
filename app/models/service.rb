class Service < ActiveRecord::Base

  belongs_to :vehicle

  has_many :performed_maintenances

  def to_s
     return self.date.to_s + ' ' + self.location
  end

end
