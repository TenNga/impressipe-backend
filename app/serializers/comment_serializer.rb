class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :author, :image_url, :rating, :recipe_id
end
