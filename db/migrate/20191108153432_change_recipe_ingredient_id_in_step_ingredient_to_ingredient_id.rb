class ChangeRecipeIngredientIdInStepIngredientToIngredientId < ActiveRecord::Migration[6.0]
  def change
    rename_column :step_ingredients, :recipe_ingredient_id, :ingredient_id
  end
end
