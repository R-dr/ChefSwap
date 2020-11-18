class RegistrationsController < Devise::RegistrationsController
  
  def after_sign_up_path_for(resource)
    if resource.is_chef?
      new_chef_path
    else
      root_path
    end
  end
end
