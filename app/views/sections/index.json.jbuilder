json.array!(@sections) do |section|
  json.extract! section, :id, :name, :seq_no, :guidance
  json.url section_url(section, format: :json)
end
