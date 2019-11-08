class ChangeIngredientIdInStepIngredientsToRecipeIngredientId < ActiveRecord::Migration[6.0]
  def change
    rename_column :step_ingredients, :ingredient_id, :recipe_ingredient_id
  end
end
