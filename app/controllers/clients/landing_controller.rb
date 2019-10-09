class Clients::LandingController < Clients::BaseController
  before_action :authenticate_client!, :check_reset_password

  def index

  end

  private

  def check_reset_password
    redirect_to edit_client_registration_path if current_client.reset_password
  end
end
