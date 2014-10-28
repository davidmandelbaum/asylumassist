json.array!(@questions) do |question|
  json.extract! question, :id, :name, :field_type, :form_id, :explanation, :page_id, :seq_no
  json.url question_url(question, format: :json)
end
