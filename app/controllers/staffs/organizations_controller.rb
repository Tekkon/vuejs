class Staffs::OrganizationsController < Staffs::BaseController
  def index
    @organizations = params[:filter].present? ? Organization.search(params[:filter]) : Organization.all
  end

  def create
    @organization = Organization.create(organization_params)
  end

  def destroy
    Organization.delete(params[:id])
  end

  private

  def organization_params
    params.permit(:title, :organization_type_id, :inn, :ogrn)
  end
end
