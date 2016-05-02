json.ignore_nil!
json.vin @vehicle.vin
json.canonical_vehicle_attributes @vehicle.canonical_vehicle, :year, :make, :model
json.fillups_attributes @vehicle.fillups, :date, :odometer, :brand, :grade, :gallons, :ppg
