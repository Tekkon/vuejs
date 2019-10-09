class AddResetPasswordToStaffs < ActiveRecord::Migration[5.2]
  def change
    add_column :staffs, :reset_password, :boolean
  end
end
