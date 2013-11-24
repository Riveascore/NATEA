json.array!(@executives) do |executive|
  json.extract! executive, :first_name, :last_name, :phone_number_id
  json.url executive_url(executive, format: :json)
end
