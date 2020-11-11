class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]
  def index
    @recipes = Recipe.all
  end

  def show; end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    @recipe.chef_id = current_user.id

    if @recipe.save
      redirect_to @recipe, notice: 'recipe was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'recipe was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
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
    params.require(:recipe).permit(:title, :cooktime, :body)
  end
end
