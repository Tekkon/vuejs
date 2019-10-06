class Staffs::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_client!

  def edit
    @client = current_client
    super
  end

  def update
    super
    current_client.update(reset_password: false)
    redirect_to clients_root_path
  end
end
