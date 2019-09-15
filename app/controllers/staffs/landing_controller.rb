class Staffs::LandingController < Staffs::BaseController
  before_action :authenticate_staff!

  def index

  end
end
