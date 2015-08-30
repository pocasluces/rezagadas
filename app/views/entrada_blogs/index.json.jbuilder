json.array!(@entrada_blogs) do |entrada_blog|
  json.extract! entrada_blog, :id, :titulo, :body, :imagen, :otro1, :otro2
  json.url entrada_blog_url(entrada_blog, format: :json)
end
