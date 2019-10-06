class Staffs::LandingController < Staffs::BaseController
  before_action :authenticate_staff!, :check_reset_password

  def index

  end

  private

  def check_reset_password
    redirect_to edit_staff_registration_path if current_staff.reset_password
  end
end
