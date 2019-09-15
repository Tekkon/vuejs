class AddApiTokenToStaffs < ActiveRecord::Migration[5.2]
  def change
    add_column :staffs, :api_token, :string, default: -> { 'gen_random_uuid()' }
    add_index :staffs, :api_token, unique: true
  end
end
