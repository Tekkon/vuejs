class Staffs::ClientsOrganizationsController < Staffs::BaseController
  before_action :authenticate_staff!

  def index
    @clients_organizations = ClientOrganization.all.order(:client_id, :organization_id)
  end

  def create
    @client_organization = ClientOrganization.create(client_organization_params)
  end

  def destroy
    ClientOrganization.where(client_id: client_organization_params[:client_id], organization_id: client_organization_params[organization_id]).delete
  end

  private

  def client_organization_params
    params.permit(:client_id, :organization_id)
  end
end
