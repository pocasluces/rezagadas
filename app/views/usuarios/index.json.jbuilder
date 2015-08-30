json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :Nombre, :email, :codigo, :solofotos, :solomates, :completo
  json.url usuario_url(usuario, format: :json)
end
