json.array!(@donations) do |donation|
  json.extract! donation, :donator_id, :donation_amount, :donation_date, :recurring, :recurring_period_months, :payment_method_id
  json.url donation_url(donation, format: :json)
end
