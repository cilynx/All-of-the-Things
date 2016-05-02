json.array!(@maintenances) do |maintenance|
  json.extract! maintenance, :id, :item, :page, :pdf, :inspectMiles, :inspectMonths, :replaceMiles, :replaceMonths
  json.url maintenance_url(maintenance, format: :json)
end
