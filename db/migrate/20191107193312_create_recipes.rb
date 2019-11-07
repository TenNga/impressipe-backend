class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :serves
      t.boolean :veg
      t.boolean :vegan
      t.boolean :dairy_free
      t.boolean :gluten_free
      t.boolean :keto
      t.boolean :healthy
      t.string :image_url
      t.integer :time_in_minute

      t.timestamps
    end
  end
end
