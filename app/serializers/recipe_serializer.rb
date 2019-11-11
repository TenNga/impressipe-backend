class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :serves, :veg, :vegan, :dairy_free, :gluten_free, :keto, :image_url, :healthy, :time_in_minute, :equipment, :ingredients
  has_many :steps, serializer: StepSerializer
  
  def ingredients
    ActiveModel::SerializableResource.new(object.recipe_ingredients.uniq{|rec_ing|rec_ing.ingredient.name},  each_serializer: RecipeIngredientSerializer)
  end
  
  def equipment
    ActiveModel::SerializableResource.new(object.equipment,  each_serializer: EquipmentSerializer)
  end

end
  
