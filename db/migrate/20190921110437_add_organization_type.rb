class AddOrganizationType < ActiveRecord::Migration[5.2]
  def change
    create_table :organization_types do |t|
      t.string :title
    end
  end
end
