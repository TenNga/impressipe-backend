class RecipeIngredient < ApplicationRecord
    has_many :step_ingredients
    has_many :steps, through: :step_ingredients
    belongs_to :ingredient, :recipe 
    
end
