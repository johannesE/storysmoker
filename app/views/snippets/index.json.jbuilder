json.array!(@snippets) do |snippet|
  json.extract! snippet, :content, :story_id
  json.url snippet_url(snippet, format: :json)
end
