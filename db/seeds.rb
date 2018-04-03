Restaurant.destroy_all
City.destroy_all
User.destroy_all

def load_image(name)
  filepath = Rails.root.join("db", "images", name)
  File.open(filepath)
end

user = User.create!({
  email: "colin@darie.eu",
  password: "password",
  username: "colinux",
})


aix = City.create!(name: "Aix-en-Provence")
marseille = City.create!(name: "Marseille")

Restaurant.create!(name: "Aux petits oignons", city: aix, user: user, photo: load_image("1.jpg"))
Restaurant.create!(name: "Via Italia", city: aix, user: user, photo: load_image("2.jpg"))
Restaurant.create!(name: "Rowing Club", city: marseille, user: user, photo: load_image("3.jpg"))

puts "#{City.count} villes ajoutées"
puts "#{Restaurant.count} restaurants ajoutés"
puts "#{User.count} users ajoutés"
