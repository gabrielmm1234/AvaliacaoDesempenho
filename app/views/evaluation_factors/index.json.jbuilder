json.array!(@evaluation_factors) do |evaluation_factor|
  json.extract! evaluation_factor, :id, :name
  json.url evaluation_factor_url(evaluation_factor, format: :json)
end
