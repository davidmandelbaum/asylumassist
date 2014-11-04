json.array!(@entries) do |entry|
  json.extract! entry, :id, :user_id, :note, :completed_at
  json.url entry_url(entry, format: :json)
end
