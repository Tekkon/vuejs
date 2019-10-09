class CreateClientsOrganizationsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :clients, :organizations
  end
end
