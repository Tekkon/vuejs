class AddApiTokenToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :api_token, :string, default: -> { 'gen_random_uuid()' }
    add_index :clients, :api_token, unique: true
  end
end
