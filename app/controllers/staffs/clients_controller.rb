class Staffs::ClientsController < Staffs::BaseController
  before_action :authenticate_staff!

  def index
    @clients = Client.all.order(:id)
  end

  def create
    @client = Client.create(client_params)
    @client.update(password: PasswordService.default, reset_password: true)
  end

  def update
    @client = Client.where(id: params[:id]).first
    @client.update(client_params)
  end

  def destroy
    Client.delete(params[:id])
  end

  private

  def client_params
    params.permit(:name, :phone, :email, :reset_password)
  end
end
