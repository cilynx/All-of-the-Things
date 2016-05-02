json.array!(@canonical_vehicles) do |canonical_vehicle|
  json.extract! canonical_vehicle, :id, :make, :model, :year
  json.url canonical_vehicle_url(canonical_vehicle, format: :json)
end
