json.ignore_nil!
json.canonical_vehicles_attributes @maintenance_schedule.canonical_vehicles, :year, :make, :model
json.maintenances_attributes @maintenance_schedule.maintenances do |maintenance|
  json.item maintenance.item
  json.page maintenance.page
  json.pdf maintenance.pdf
  json.inspectMiles maintenance.inspectMiles
  json.inspectMonths maintenance.inspectMonths
  json.replaceMiles maintenance.replaceMiles
  json.replaceMonths maintenance.replaceMonths
  json.steps_attributes maintenance.steps, :text, :seeAlso, :imageMD5
end
