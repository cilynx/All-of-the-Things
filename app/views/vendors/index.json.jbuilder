json.array!(@vendors) do |vendor|
  json.extract! vendor, :id, :name, :aliases, :tags
  json.url vendor_url(vendor, format: :json)
end
