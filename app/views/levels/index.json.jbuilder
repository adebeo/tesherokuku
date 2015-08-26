json.array!(@levels) do |level|
  json.extract! level, :id, :name, :description, :order, :program_id
  json.url level_url(level, format: :json)
end
