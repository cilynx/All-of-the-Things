json.array!(@performed_maintenance_parts) do |performed_maintenance_part|
  json.extract! performed_maintenance_part, :id, :performed_maintenance_id, :part_id, :cost
  json.url performed_maintenance_part_url(performed_maintenance_part, format: :json)
end
