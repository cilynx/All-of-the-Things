json.array!(@performed_maintenances) do |performed_maintenance|
  json.extract! performed_maintenance, :id, :maintenance_id, :service_id
  json.url performed_maintenance_url(performed_maintenance, format: :json)
end
