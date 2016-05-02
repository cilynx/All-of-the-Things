json.array!(@services) do |service|
  json.extract! service, :id, :date, :odometer, :location, :vehicle_id
  json.url service_url(service, format: :json)
end
