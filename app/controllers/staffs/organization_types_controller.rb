class Staffs::OrganizationTypesController < Staffs::BaseController
  def index
    @organization_types = OrganizationType.all
  end
end
