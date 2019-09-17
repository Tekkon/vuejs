class Staffs::BaseController < ApplicationController
  layout 'staffs_application'

  protected

  def after_sign_in_path_for(resource)
    staffs_path
  end
end
