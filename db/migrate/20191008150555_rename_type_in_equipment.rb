class RenameTypeInEquipment < ActiveRecord::Migration[5.2]
  def change
    rename_column :equipment, :type, :type_name
  end
end
