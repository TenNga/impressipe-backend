class StepIngredient < ApplicationRecord
    belongs_to :step, :recipe_ingredient
end
