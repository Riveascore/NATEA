json.array!(@cause_categories) do |cause_category|
  json.extract! cause_category, :category_name, :description
  json.url cause_category_url(cause_category, format: :json)
end
