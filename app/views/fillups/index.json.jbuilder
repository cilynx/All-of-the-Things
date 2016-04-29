json.array!(@fillups) do |fillup|
  json.extract! fillup, :id, :date, :odometer, :gallons, :ppg, :brand, :grade
  json.url fillup_url(fillup, format: :json)
end
