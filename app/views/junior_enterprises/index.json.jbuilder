json.array!(@junior_enterprises) do |junior_enterprise|
  json.extract! junior_enterprise, :id, :name
  json.url junior_enterprise_url(junior_enterprise, format: :json)
end
