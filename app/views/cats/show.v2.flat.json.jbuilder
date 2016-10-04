json.superCat do
  json.properties @cat.various_properties.flatten(10)
  json.superId @cat.id
  json.fullName @cat.name
end