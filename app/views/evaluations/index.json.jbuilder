json.array!(@evaluations) do |evaluation|
  json.extract! evaluation, :id, :usuario_avaliado_id, :usuario_avaliador_id, :date, :done, :evaluation_model_id
  json.url evaluation_url(evaluation, format: :json)
end
