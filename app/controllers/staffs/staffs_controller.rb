class Staffs::StaffsController < Staffs::BaseController
  before_action :authenticate_staff!

  def index
    @staffs = Staff.all.order(:id)
  end

  def create
    @staff = Staff.create(staff_params)
    @staff.update(password: PasswordService.default)
  end

  def update
    @staff = Staff.where(id: params[:id]).first
    @staff.update(staff_params)
  end

  def destroy
    Staff.delete(params[:id])
  end

  def current
    @staff = current_staff
  end

  private

  def staff_params
    params.permit(:name, :phone, :email, :reset_password)
  end
end
