json.array!(@pages) do |page|
  json.extract! page, :id, :seq_no, :name, :guidance, :section_id
  json.url page_url(page, format: :json)
end
