json.array!(@billing_addresses) do |billing_address|
  json.extract! billing_address, :donator_id, :main_contact, :address1, :address2, :city, :state, :zip, :country
  json.url billing_address_url(billing_address, format: :json)
end
