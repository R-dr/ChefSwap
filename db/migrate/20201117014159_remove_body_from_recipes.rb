class RemoveBodyFromRecipes < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipes, :body, type: :text
  end
end
