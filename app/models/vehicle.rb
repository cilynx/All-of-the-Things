class Vehicle < ActiveRecord::Base
  belongs_to :user, inverse_of: :vehicles
  
  has_many :fillups

  def image_file=(input_data)
     self.image = input_data.read
     self.content_type = input_data.content_type.chomp
  end
end
