json.array!(@comentarios) do |comentario|
  json.extract! comentario, :id, :entrada_blog_id, :body
  json.url comentario_url(comentario, format: :json)
end
