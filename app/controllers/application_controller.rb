# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :error, :success

  layout :layout_for_resource
  protected

  def layout_for_resource
    if devise_controller?
      'devise'
    else
      'application'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name is_chef avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name is_chef avatar])
  end
end
