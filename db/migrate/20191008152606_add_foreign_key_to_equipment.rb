class AddForeignKeyToEquipment < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :equipment, :organizations
  end
end
