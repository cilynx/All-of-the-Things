json.array!(@steps) do |step|
  json.extract! step, :id, :text, :imageMD5
  json.url step_url(step, format: :json)
end
