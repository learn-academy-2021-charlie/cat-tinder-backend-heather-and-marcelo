# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
turtles = [
  {
    id: 1,
    name: "Crush",
    age: 100,
    enjoys: "swimming and chilling in the ocean"
  },
  {
    id: 2,
    name: "SuperHero",
    age: 15,
    enjoys: "dandelions, clover and sunshine"
  },
  {
    id: 3,
    name: "Kappa",
    age: 150,
    enjoys: "getting all the attention as half turtle half human"
  },
  {
    id: 4,
    name: "Alfie",
    age: 78,
    enjoys: "Quite the romantic, loves big cities"
  },
  {
    id: 5,
    name: "Morla",
    age: 35,
    enjoys: "Enormous and wise. Loves swamps"
  },
  {
    id: 6,
    name: "Yertle",
    age: 120,
    enjoys: "King of the pond, that is magnificent, beautiful, and everything else you can imagine."
  }
]

turtles.each do |value|
  Turtle.create value
  puts "creating turtle #{value}"
end
