json.array! @equipment do |eq|
  json.id eq.id
  json.organization_id eq.organization_id
  json.name eq.name
  json.type eq.type_name
  json.serial_number eq.serial_number
end
