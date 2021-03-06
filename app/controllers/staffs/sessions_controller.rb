# frozen_string_literal: true

class Staffs::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    if ApiTokenService.call.present?
      warden.authenticate!(:staff_api_token)
    end

    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  protected

  def after_sign_in_path_for(resource)
    staffs_root_path
  end

  def after_sign_out_path_for(resource)
    new_staff_session_path
  end
end
