json.array!(@phone_numbers) do |phone_number|
  json.extract! phone_number, :donator_id, :main_contact, :country_code, :area_code, :number
  json.url phone_number_url(phone_number, format: :json)
end
