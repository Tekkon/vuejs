class AddOrganization < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :title
      t.integer :organization_type_id
      t.string :inn
      t.string :ogrn
    end
  end
end
