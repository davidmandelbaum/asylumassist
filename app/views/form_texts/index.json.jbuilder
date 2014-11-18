json.array!(@form_texts) do |form_text|
  json.extract! form_text, :id, :guidance, :seq_no, :page_id
  json.url form_text_url(form_text, format: :json)
end
