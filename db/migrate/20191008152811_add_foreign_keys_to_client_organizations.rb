class AddForeignKeysToClientOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :client_organizations, :organizations
    add_foreign_key :client_organizations, :clients
  end
end
