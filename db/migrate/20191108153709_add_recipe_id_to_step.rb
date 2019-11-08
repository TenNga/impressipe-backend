class AddRecipeIdToStep < ActiveRecord::Migration[6.0]
  def change
    add_column :steps, :recipe_id, :integer
  end
end
