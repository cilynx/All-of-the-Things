json.array!(@parts) do |part|
  json.extract! part, :id, :pn, :description, :url
  json.url part_url(part, format: :json)
end
