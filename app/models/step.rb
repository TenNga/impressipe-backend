class Step < ApplicationRecord
    has_many :step_ingredients, :step_equipments
    has_many :equipments, through: :step_equipments
    has_many :recipe_ingredients, through: :step_ingredients
end
