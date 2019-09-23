class Staffs::ClientsController < Staffs::BaseController
  before_action :authenticate_staff!

  def index
    @clients = Client.all
  end

  def create
    @client = Client.create(client_params)
  end

  private

  def client_params
    params.permit(:name, :phone, :email)
  end
end
