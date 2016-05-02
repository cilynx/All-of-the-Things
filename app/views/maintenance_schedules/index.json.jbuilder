json.array!(@maintenance_schedules) do |maintenance_schedule|
  json.extract! maintenance_schedule, :id
  json.url maintenance_schedule_url(maintenance_schedule, format: :json)
end
