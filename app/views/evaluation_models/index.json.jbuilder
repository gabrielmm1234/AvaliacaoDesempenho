json.array!(@evaluation_models) do |evaluation_model|
  json.extract! evaluation_model, :id, :name
  json.url evaluation_model_url(evaluation_model, format: :json)
end
