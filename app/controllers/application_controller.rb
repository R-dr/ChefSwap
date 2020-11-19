# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_chef_attributes
 
  protected
# ensures users cant access chef only pages
  def authorize_chef
    redirect_to listings_path, notice: 'you must be a chef to access this.' unless current_user.is_chef?
  end
## ensures chefs complete their profile before continuing
  def check_chef_attributes
    if user_signed_in? && current_user.is_chef && !Chef.find_by(user_id: current_user)
      redirect_to new_chef_path, notice: 'Please finalize your chef profile before continuing'
    end
  end
#devise config for allowed params
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name is_chef])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name])
  end
end
