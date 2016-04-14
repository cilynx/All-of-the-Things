json.array!(@aliases) do |alias|
  json.extract! alias, :id, :payee, :memo, :vendor_id
  json.url alias_url(alias, format: :json)
end
