# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cities = [{name: 'Hồ Chí Minh'},
					{name: 'Hà Nội'},
					{name: 'Đà Nẵng'},
					{name: 'Cần Thơ'}]

cities.each do |city|
	City.create(city)
end