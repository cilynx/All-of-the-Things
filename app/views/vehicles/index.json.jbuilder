json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :id, :year, :make, :model, :vin, :user_id
  json.url vehicle_url(vehicle, format: :json)
end
