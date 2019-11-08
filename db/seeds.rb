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
puts 'Seeding ingredients ok!'
puts '+++++++++++++++++++++++++++++'

puts 'Cleaning db cocktails'
Cocktail.destroy_all
puts 'Seeding cocktails .............'
Cocktail.create!(name: 'Gin', remote_photo_url: 'https://images.unsplash.com/photo-1509669803555-fd5edd8d5a41?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80')
Cocktail.create!(name: 'Whisky', remote_photo_url: 'https://images.unsplash.com/photo-1559443922-3f698a0ff27a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=669&q=80')
Cocktail.create!(name: 'Mojito', remote_photo_url: 'https://images.unsplash.com/photo-1544145945-f90425340c7e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80')
Cocktail.create!(name: 'BissapMix', remote_photo_url: 'https://images.unsplash.com/photo-1501199532894-9449c0a85a77?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80')
Cocktail.create!(name: 'GingembreRel', remote_photo_url: 'https://images.unsplash.com/photo-1568821113482-77d025de761d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=645&q=80')

#Dose.create(cocktail: cocktail1, ingredient: ingredient1, description: "Gin Tonic with lemons")
#Dose.create(cocktail: cocktail2, ingredient: ingredient2, description: "Whisky with ice")

puts 'finished!'
