class Staffs::LandingController < Staffs::BaseController
  before_action :authenticate_staff!

  def index

  end

  def current
    @staff = current_staff
  end
end
