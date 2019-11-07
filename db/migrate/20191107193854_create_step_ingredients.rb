class CreateStepIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :step_ingredients do |t|
      t.integer :ingredient_id
      t.integer :step_id

      t.timestamps
    end
  end
end
