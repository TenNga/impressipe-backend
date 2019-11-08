class StepSerializer < ActiveModel::Serializer
  attributes :id, :number, :text, :ingredients
  belongs_to :recipe

  def ingredients
    ActiveModel::SerializableResource.new(object.ingredients,  each_serializer: IngredientSerializer)
  end
  
end
