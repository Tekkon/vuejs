class Staffs::ClientOrganizationsController < Staffs::BaseController
  before_action :authenticate_staff!

  def index
    @client_organizations = ClientOrganization.all.order(:client_id, :organization_id)
  end

  def create
    @client_organization = ClientOrganization.create(client_organization_params)
  end

  def destroy
    ClientOrganization.delete(params[:id])
  end

  private

  def client_organization_params
    params.permit(:client_id, :organization_id)
  end
end
