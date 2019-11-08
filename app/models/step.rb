class Step < ApplicationRecord
    has_many :step_ingredients
    has_many :step_equipments
    has_many :equipments, through: :step_equipments
    has_many :ingredients, through: :step_ingredients
    belongs_to :recipe
end
