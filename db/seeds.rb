# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

FactoryGirl.create(:mutant, :admin, name: 'xavier')
%w(cyclops iceman angel beast mimic wolverine banshee storm rogue)
  .each {|n| FactoryGirl.create(:mutant, name: n) }
%w(alpha beta gamma delta).each { |n| FactoryGirl.create(:team, name: n) }
["Workout", "Kill monsters", "Sleep", "Free prisoners", "Clean room", "Repair aircraft"]
  .zip(Team.all.cycle).each{|task, team| FactoryGirl.create(:task, name: task, team: team)}

Mutant.all.cycle(2).zip(Team.all.cycle).each {|mutant, team| team.mutants << mutant}


