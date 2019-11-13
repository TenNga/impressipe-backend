require 'rest-client'
require 'json'
class Hash
    def without(*keys)
      cpy = self.dup
      keys.each { |key| cpy.delete(key) }
      cpy
    end
end

Recipe.destroy_all
Ingredient.destroy_all
RecipeIngredient.destroy_all
Step.destroy_all
StepIngredient.destroy_all
Equipment.destroy_all
StepEquipment.destroy_all

url = "https://api.spoonacular.com/recipes"
random = "/random?number=10"
analyzed_instructions = "/analyzedInstructions"
key = "apiKey=c25665a0759d40ffb38e875f1638e2d3"

arr=["&", "&tags=vegetarian&", "&tags=vegan&", "&tags=ketogenic&", "&tags=dairy-free&", "&tags=gluten-free&"]

arr.each do |el|
    response = RestClient.get(url + random + el + key)
    recipe_results = JSON.parse(response)["recipes"] 

    recipes = recipe_results.map do |recipe|
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
        time_in_minute: recipe["readyInMinutes"],
        ingredients: recipe["extendedIngredients"].map do |ingredient| 
            {
                name: ingredient["name"],
                quantity: ingredient["amount"],
                unit: ingredient["unit"],
                id: ingredient["id"]
            } 
        end
        }
    end


    recipes.each do |recipe| 
        Recipe.create(recipe.without(:ingredients))
        recipe_id = Recipe.all.find{|rec| rec.name == recipe[:name]}.id

        recipe[:ingredients].each do |ingredient|
            unless Ingredient.all.find{|ing| ing.name == ingredient[:name] && ing.api_id == ingredient[:id]}
                Ingredient.create(name: ingredient[:name], api_id: ingredient[:id])
            end
            ingredient_id = Ingredient.all.find{|ing| ing.name == ingredient[:name]}.id
            RecipeIngredient.create(ingredient_id: ingredient_id, recipe_id: recipe_id, unit: ingredient[:unit], quantity: ingredient[:quantity])
        end
    end

    recipe_results.each do |recipe|
        recipe_id = Recipe.all.find{|rec| rec.name == recipe["title"]}.id
        response = RestClient.get(url + "/" + recipe["id"].to_s + analyzed_instructions + "?" + key)
        JSON.parse(response)[0]["steps"].each do |step|
            step_id = Step.create(text: step["step"], number: step["number"], recipe_id: recipe_id).id
            step["equipment"].each do |equipment|
                equipment_id = Equipment.create(name: equipment["name"]).id
                StepEquipment.create(step_id: step_id, equipment_id: equipment_id)
            end
            step["ingredients"].each do |ingredient|
                puts ingredient
                if Ingredient.all.find{|ing| ing.api_id == ingredient["id"].to_i || ing.name.include?(ingredient["name"]) || ingredient["name"].include?(ing.name)}
                    ingredient_id = Ingredient.all.find{|ing| ing.api_id == ingredient["id"].to_i || ing.name.include?(ingredient["name"]) || ingredient["name"].include?(ing.name)}.id
                    StepIngredient.create(step_id: step_id, ingredient_id: ingredient_id)
                end
            end
        end
    end
end






