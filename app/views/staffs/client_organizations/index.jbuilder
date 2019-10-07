json.array! @client_organizations do |co|
  json.id co.id
  json.client_id co.client_id
  json.organization_id co.organization_id
end
