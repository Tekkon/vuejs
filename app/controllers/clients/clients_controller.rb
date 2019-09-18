class Clients::ClientsController < Clients::BaseController
  before_action :authenticate_client!

  def index

  end

  def current
    @client = current_client
  end
end
