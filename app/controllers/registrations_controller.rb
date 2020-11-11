class RegistrationsController < Devise::RegistrationsController
  def create
    super
    resource.avatar.attach(params[:user][:avatar])
  end

  def edit
    super
    resource.avatar.attach(params[:user][:avatar])
  end

  def after_sign_up_path_for(resource)
    if resource.chef?
      new_chef_path
    else
      root_path
    end
  end
end
