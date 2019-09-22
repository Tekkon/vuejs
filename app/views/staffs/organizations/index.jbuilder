json.array! @organizations do |org|
  json.id org.id
  json.organization_type_id org.organization_type_id
  json.title org.title
  json.inn org.inn
  json.ogrn org.ogrn
end
