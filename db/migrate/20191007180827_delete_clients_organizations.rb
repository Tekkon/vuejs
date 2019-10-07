class DeleteClientsOrganizations < ActiveRecord::Migration[5.2]
  def change
    drop_table :clients_organizations
  end
end
