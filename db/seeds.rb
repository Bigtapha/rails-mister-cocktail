require 'open-uri'
require 'json'

puts 'Cleaning db ingredient'
Ingredient.destroy_all

puts'seeding db'
puts '=========='
puts 'parsing js file'

records = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)
ingredients = records['drinks']
ingredients.each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end

Cocktail.create(name: "Gin")
Cocktail.create(name: "Whisky")
Cocktail.create(name: "Mojito")
Cocktail.create(name: "BissapMix")
Cocktail.create(name: "GingembreRel")

#Dose.create(cocktail: cocktail1, ingredient: ingredient1, description: "Gin Tonic with lemons")
#Dose.create(cocktail: cocktail2, ingredient: ingredient2, description: "Whisky with ice")

puts 'finished!'
