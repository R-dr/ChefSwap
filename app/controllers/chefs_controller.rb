# frozen_string_literal: true

class ChefsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chef, only: %i[show edit update destroy]
  before_action :owner_chef?, only: %i[edit update destroy]
  before_action :authenticate_chef!
  skip_before_action :check_chef_attributes, only: %i[new create]
  # GET /chefs/new
  def new
    @chef = Chef.new
  end

  # POST /chefs
  def create
    @chef = Chef.new(chef_params)
    @chef.user = current_user

    if @chef.save
      redirect_to @chef, notice: 'Chef was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /chefs/1
  def update
    if @chef.update(chef_params)
      redirect_to @chef, notice: 'Chef was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /chefs/1
  def destroy
    @chef.destroy
    redirect_to chefs_url, notice: 'Chef was successfully destroyed.'
  end

  private
 #determines if the chef that is signde in is the owner of the item
  def owner_chef?
    Chef.find_by(user_id: current_user.id).id
  end
 ## determines if the current use is a chef to show them chef only pages
  def authenticate_chef!
    redirect_to listings_path, notice: 'you must be a chef to access this.' unless current_user.is_chef?
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_chef
    @chef = Chef.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def chef_params
    params.require(:chef).permit(:bio, :id, :avatar)
  end
end
