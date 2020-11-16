class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]
  before_action  :authorize_chef
  def index
    @recipes = current_user.chef.recipes.all
  end

  def show; end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    @recipe.chef_id = Chef.find_by(user_id:current_user.id).id # searches chef table for a chef with the same user_id as the current user
    if @recipe.save
      redirect_to @recipe, notice: 'recipe was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /recipes/1
  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'recipe was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: 'recipe was successfully destroyed.'
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:title, :cooktime, :body, :image)
  end
end
