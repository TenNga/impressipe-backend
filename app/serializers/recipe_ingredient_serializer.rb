class RecipeIngredientSerializer < ActiveModel::Serializer
  attributes :id, :name, :quantity, :unit, :api_id
  def id
    ActiveModel::SerializableResource.new(object.ingredient.id)
  end

  def name
    ActiveModel::SerializableResource.new(object.ingredient.name)
  end

  def api_id
    ActiveModel::SerializableResource.new(object.ingredient.api_id)
  end
end
