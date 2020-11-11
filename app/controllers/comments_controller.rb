class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_recipe!

  def index
    @comments = @recipe.comments.order(created_at: :desc)
  end

  def create
    @comment = @recipe.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save

    redirect_to recipe_path(@recipe)
  end

  private

  def find_recipe!
    @recipe = Recipe.find(params[:recipe_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
