json.array!(@registros) do |registro|
  json.extract! registro, :id
  json.url registro_url(registro, format: :json)
end
