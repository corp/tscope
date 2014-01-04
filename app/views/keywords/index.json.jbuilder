json.array!(@keywords) do |keyword|
  json.extract! keyword, :id, :word
  json.url keyword_url(keyword, format: :json)
end
