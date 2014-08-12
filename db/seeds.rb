# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
OFFICES_COUNT = 6

ranks = ['manager', 'developer', 'markuper', 'designer']
ranks.each do |rank|
  Rank.create(:name => rank)
end

(1..OFFICES_COUNT).each do |office_num|
  Office.create(:number => office_num)
end