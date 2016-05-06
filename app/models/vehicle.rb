class Vehicle < ActiveRecord::Base
  belongs_to :user, inverse_of: :vehicles
  belongs_to :canonical_vehicle, inverse_of: :vehicles
  has_many :maintenances, through: :canonical_vehicle

  has_many :fillups
  has_many :services

  def to_s
     return self.canonical_vehicle.to_s
  end

  def image_file=(input_data)
     self.image = input_data.read
     self.content_type = input_data.content_type.chomp
  end

  def self.import(file, vehicle_id)
     require 'date'

     mcount = 0
     count = 0

     File.foreach(file.path).with_index do |line, index|
	if(line.match("Date,Mileage,Action,Location,Cost,Gallons,PPG"))
	   @type = "Mileage CSV"
	   next
	elsif(line.match("Total:"))
	   next
	elsif(@type.match("Mileage CSV"))
	   array = line.split(',')
	   array[2].sub!('Premium Fuel','91')
	   array[2].sub!('Plus Fuel','89')
	   array[2].sub!('Regular Fuel','86')
	   @fillup = Fillup.where(
	      date: Date.strptime(array[0], '%m/%d/%Y'),
	      odometer: array[1],
	      grade: array[2],
	      brand: array[3],
	      gallons: array[5],
	      ppg: array[6]
	   ).take || Fillup.new
	   if(@fillup.odometer)
	      mcount += 1
	   else
	      @fillup.vehicle_id = vehicle_id
	      @fillup.date = Date.strptime(array[0], '%m/%d/%Y')
	      @fillup.odometer = array[1]
	      @fillup.grade = array[2]
	      @fillup.brand = array[3]
	      @fillup.gallons = array[5]
	      @fillup.ppg = array[6]
	      @fillup.save
	   end
	   count += 1
	end
     end

     return "Imported #{count} transactions from #{@type}. #{count - mcount} were new and #{mcount} matched existing transactions"
  end

end
