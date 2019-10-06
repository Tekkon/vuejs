class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.string :name, null: false
      t.string :type, null: false
      t.string :serial_number, null: false
    end
  end
end
