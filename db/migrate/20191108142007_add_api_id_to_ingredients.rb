class AddApiIdToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :api_id, :integer
  end
end
