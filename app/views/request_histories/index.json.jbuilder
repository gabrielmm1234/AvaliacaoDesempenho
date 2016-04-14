json.array!(@request_histories) do |request_history|
  json.extract! request_history, :id, :name, :email, :approved
  json.url request_history_url(request_history, format: :json)
end
