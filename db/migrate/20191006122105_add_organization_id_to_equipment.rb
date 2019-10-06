class AddOrganizationIdToEquipment < ActiveRecord::Migration[5.2]
  def change
    add_column :equipment, :organization_id, :bigint
  end
end
