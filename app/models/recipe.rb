class Recipe < ApplicationRecord
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    has_many :steps
    has_many :comments
    accepts_nested_attributes_for :steps, allow_destroy: true
    
    def equipment
        self.steps.map{|step|step.equipments}.flatten.uniq{|equipment|equipment.name}
    end
end
