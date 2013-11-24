json.array!(@causes) do |cause|
  json.extract! cause, :name, :city, :state, :zip, :monthly_sponsorship, :employer_identification_number, :mission_description, :cause_category_id, :executive_id, :phone_number_id, :contact_email
  json.url cause_url(cause, format: :json)
end
