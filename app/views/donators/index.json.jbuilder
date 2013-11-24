json.array!(@donators) do |donator|
  json.extract! donator, :first_name, :last_name, :email
  json.url donator_url(donator, format: :json)
end
