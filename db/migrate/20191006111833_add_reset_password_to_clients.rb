class AddResetPasswordToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :reset_password, :boolean
  end
end
