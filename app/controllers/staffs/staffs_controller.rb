class Staffs::StaffsController < Staffs::BaseController
  before_action :authenticate_staff!

  def index
    @staffs = Staff.all
  end

  def create
    @staff = Staff.create(staff_params)
  end

  def destroy
    Staff.delete(params[:id])
  end

  def current
    @staff = current_staff
  end

  private

  def staff_params
    params.permit(:name, :phone, :email)
  end
end
