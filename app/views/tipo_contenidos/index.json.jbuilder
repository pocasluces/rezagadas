json.array!(@tipo_contenidos) do |tipo_contenido|
  json.extract! tipo_contenido, :id, :astrofoto, :metematica, :otro1, :otro2, :otrotxt
  json.url tipo_contenido_url(tipo_contenido, format: :json)
end
