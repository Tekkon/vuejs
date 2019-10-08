class Staffs::EquipmentController < Staffs::BaseController
  def index
    @equipment = Equipment.all
  end

  def create
    @equipment = Equipment.create(equipment_params)
  end

  def destroy
    Equipment.delete(params[:id])
  end

  private

  def equipment_params
    params.permit(:name, :type_name, :serial_number, :organization_id)
  end
end
