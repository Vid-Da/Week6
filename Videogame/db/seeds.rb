# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

t = Tournament.create(name: "Final Fight" )

p = Player.create(name: "Ryu", tournaments: [t])
p2 = Player.create(name: "Ken", tournaments: [t])

