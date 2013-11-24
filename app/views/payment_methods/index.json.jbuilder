json.array!(@payment_methods) do |payment_method|
  json.extract! payment_method, :donator_id, :type, :routing_number, :expiration_date, :billing_address_id, :phone_number_id
  json.url payment_method_url(payment_method, format: :json)
end
