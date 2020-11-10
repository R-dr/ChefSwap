# frozen_string_literal: true

class ChefsController < ApplicationController
  before_action :set_chef

  
 

  # GET /chefs/new
  def new
    @chef = Chef.new
  end

  def index
    @chefs = Chef.all
  end

  # POST /chefs
  def create
    @chef = Chef.new(chef_params)

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

  # Use callbacks to share common setup or constraints between actions.
  def set_chef
    @chef = Chef.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def chef_params
    params.require(:chef).permit(:bio,:id)
  end
end
