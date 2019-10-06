class Staffs::RegistrationsController < Staffs::BaseController
  before_action :authenticate_client!

  def edit
    @client = current_client
  end

  def update
    if update_password_params[:password] == update_password_params[:password_confirmation]
      current_client.update(password: update_password_params[:password], reset_password: false)
    else
      redirect_to edit_client_registration_path
    end
  end

  private

  def update_password_params
    params.require(:client).permit(:password, :password_confirmation)
  end
end
