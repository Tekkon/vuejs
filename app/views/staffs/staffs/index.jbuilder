json.array! @staffs do |staff|
  json.id staff.id
  json.name staff.name
  json.email staff.email
  json.phone staff.phone
end
