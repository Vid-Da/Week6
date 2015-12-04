player1 = Player.create(name: "freak1")
player2 = Player.create(name: "freak2")
player3 = Player.create(name: "freak3")
player4 = Player.create(name: "freak4")
player5 = Player.create(name: "freak5")

match1 = Match.create(winner_faction: 'protoss', loser_faction: 'terran', duration: 30, date: Date.yesterday, winner_id: 1, loser_id: 2)
match2 = Match.create(winner_faction: 'protoss', loser_faction: 'terran', duration: 30, date: Date.yesterday, winner_id: 2, loser_id: 3)
match3 = Match.create(winner_faction: 'protoss', loser_faction: 'terran', duration: 30, date: Date.yesterday, winner_id: 3, loser_id: 4)
match4 = Match.create(winner_faction: 'protoss', loser_faction: 'terran', duration: 30, date: Date.yesterday, winner_id: 1, loser_id: 2)
match5 = Match.create(winner_faction: 'protoss', loser_faction: 'terran', duration: 30, date: Date.yesterday, winner_id: 1, loser_id: 2)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
