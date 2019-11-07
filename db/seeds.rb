require 'rest-client'
require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#https://api.spoonacular.com/recipes/random?number=2&tags=vegetarian&apiKey=c25665a0759d40ffb38e875f1638e2d3

url = "https://api.spoonacular.com/recipes"
random = "/random?number=2&tags="
analyzed_instruction = "/analyzedInstructions"
key = "apiKey=c25665a0759d40ffb38e875f1638e2d3"

response = RestClient.get(url + random + "vegetarian&" + key) #return 5 randam Veg
veg_recipe_results = JSON.parse(response)["recipes"] 

# veg_instructions = veg_recipe_results.map do |recipe, i|
#     response = RestClient.get(url + “/” + recipe["id"].to_s + analyzed_instructions + “?” + key)
#     JSON.parse(response)[0]
# end

veg_recipes = veg_recipe_results.map do |recipe|
    {
    name: recipe["title"],
    serves: recipe["servings"],
    veg: recipe["vegetarian"],
    vegan: recipe["vegan"],
    dairy_free: recipe["dairyFree"],
    gluten_free: recipe["glutenFree"],
    keto: recipe["ketogenic"],
    healthy: recipe["veryHealthy"],
    image_url: recipe["image"],
    time_in_minute: recipe["readyInMinutes"]
    }
end

veg_ingredients =  veg_recipe_results.map do |recipe|
    recipe["extendedIngredients"].map do |ingredient| 
        {
            name: ingredient["name"],
            image: ingredient["image"],
            quantity: ingredient["amount"],
            unit: ingredient["unit"]
        } 
    end
end

veg_recipes.each {|recipe| Recipe.create(recipe)}
veg_ingredients.each do |ingredient|
    unless Ingredient.all.include(recipe["name"]) do
        Ingredient.create(name: ingredient["name"], image_url: ingredient["image"])
    end
    Recipe






