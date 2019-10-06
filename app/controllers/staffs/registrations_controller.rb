class Staffs::RegistrationsController < Staffs::BaseController
  before_action :authenticate_staff!

  def edit
    @staff = current_staff
  end

  def update
    if update_password_params[:password] == update_password_params[:password_confirmation]
      current_staff.update(password: update_password_params[:password], reset_password: false)
    else
      redirect_to edit_staff_registration_path
    end
  end

  private

  def update_password_params
    params.require(:staff).permit(:password, :password_confirmation)
  end
end
