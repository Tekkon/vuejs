json.array! @clients_organizations do |co|
  json.client_id co.client_id
  json.organization_id co.organization_id
end
