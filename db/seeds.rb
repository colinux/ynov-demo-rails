Restaurant.destroy_all
City.destroy_all

aix = City.create!(name: "Aix-en-Provence")
marseille = City.create!(name: "Marseille")

Restaurant.create!(name: "Aux petits oignons", city: aix)
Restaurant.create!(name: "Via Italia", city: aix)
Restaurant.create!(name: "Rowing Club", city: marseille)

puts "#{City.count} villes ajoutées"
puts "#{Restaurant.count} restaurants ajoutés"
