# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_chef_attributes
  protected

  def authorize_chef
    redirect_to listings_path, notice: 'you must be a chef to access this.' unless current_user.is_chef?
  end
  def check_chef_attributes
    if user_signed_in? && current_user.is_chef && !(Chef.find_by(user_id: current_user))
      redirect_to new_chef_path, notice:'Please finalize your chef profile before continuing'
    end
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name is_chef ])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name ])
  end
end
