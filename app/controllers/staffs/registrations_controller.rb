class Staffs::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_staff!

  def edit
    @staff = current_staff
  end

  def update
    current_staff.update(reset_password: false)
    super
  end
end
