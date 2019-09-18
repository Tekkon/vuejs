class Clients::LandingController < Clients::BaseController
  before_action :authenticate_client!

  def index

  end
end
