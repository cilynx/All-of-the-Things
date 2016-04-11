json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :date, :action, :vendor_id, :price, :json
  json.url transaction_url(transaction, format: :json)
end
