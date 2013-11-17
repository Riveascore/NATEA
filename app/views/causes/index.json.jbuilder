json.array!(@causes) do |cause|
  json.extract! cause, :name, :city, :state, :zip, :monthlySponsorship, :taxID, :missionDescription, :categoryID, :executiveID, :contactPhone, :contactEmail
  json.url cause_url(cause, format: :json)
end
