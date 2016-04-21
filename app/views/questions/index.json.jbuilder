json.array!(@questions) do |question|
  json.extract! question, :id, :description
  json.url question_url(question, format: :json)
end
