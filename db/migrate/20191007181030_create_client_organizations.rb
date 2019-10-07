class CreateClientOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :client_organizations do |t|
      t.bigint :client_id
      t.bigint :organization_id
    end

    add_index :client_organizations, [:client_id, :organization_id], unique: true
  end
end
