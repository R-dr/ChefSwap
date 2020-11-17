# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def authorize_chef
    redirect_to listings_path, notice: 'you must be a chef to access this.' unless current_user.is_chef?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name is_chef avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name is_chef avatar])
  end
end
