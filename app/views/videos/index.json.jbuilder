json.array!(@videos) do |video|
  json.extract! video, :id, :name, :description, :lien, :order, :level_id
  json.url video_url(video, format: :json)
end
